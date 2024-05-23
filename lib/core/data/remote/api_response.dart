import 'package:dokterian_test/core/util/response_parser.dart';

class ApiResponse<T> {
  final Metadata? metadata;
  final ResponseObject<T>? response;

  ApiResponse({
    this.metadata,
    this.response,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        response: json["response"] == null
            ? null
            : ResponseObject<T>.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "response": response?.toJson(),
      };
}

class ApiResponseList<T> {
  final Metadata? metadata;
  final ResponseList<T>? response;

  ApiResponseList({
    this.metadata,
    this.response,
  });

  factory ApiResponseList.fromJson(Map<String, dynamic> json) =>
      ApiResponseList(
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        response: json["response"] == null
            ? null
            : ResponseList<T>.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "response": response?.toJson(),
      };
}

class Metadata {
  final int? status;
  final String? message;

  Metadata({
    this.status,
    this.message,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class ResponseObject<T> {
  final T? data;

  ResponseObject({this.data});

  factory ResponseObject.fromJson(Map<String, dynamic> json) => ResponseObject(
        data: json["data"] == null
            ? null
            : ResponseParser<T>().fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : ResponseParser<T>().toJson(data as T),
      };
}

class ResponseList<T> {
  final List<T>? data;

  ResponseList({this.data});

  factory ResponseList.fromJson(Map<String, dynamic> json) => ResponseList(
        data: json['data'] == null
            ? null
            : List<T>.from(
                json['data'].map((x) => ResponseParser<T>().fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : ResponseParser<T>().toJson(data as T),
      };
}
