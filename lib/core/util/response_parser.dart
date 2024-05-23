import 'package:dokterian_test/feature/auth/data/model/auth_response_model.dart';
import 'package:dokterian_test/feature/main/data/model/doctor_nearby_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

bool typeEqual<L, R>() => L == R;

bool typeEqualn<L, R>() => typeEqual<L, R>() || typeEqual<L?, R?>();

class ResponseParser<T> extends JsonConverter<T, Object> {
  @override
  T fromJson(Object json) {
    if (json is List && json.isEmpty) json = <String, dynamic>{};

    if (json is Map<String, dynamic> == false) {
      return json as T;
    }

    json = json as Map<String, dynamic>;

    if (typeEqualn<T, AuthResponseModel>()) {
      return AuthResponseModel.fromJson(json) as T;
    } else if (typeEqualn<T, DoctorNearbyModel>()) {
      return DoctorNearbyModel.fromJson(json) as T;
    } else if (typeEqualn<T, dynamic>()) {
      return dynamic as T;
    }

    throw UnimplementedError("`$T` fromJson factory not implemented");
  }

  @override
  Object toJson(T object) {
    if (typeEqualn<T, AuthResponseModel>()) {
      return (object as AuthResponseModel).toJson();
    } else if (typeEqualn<T, DoctorNearbyModel>()) {
      return (object as DoctorNearbyModel).toJson();
    } else if (typeEqualn<T, dynamic>()) {
      return (object as dynamic);
    }

    throw UnimplementedError("`$T` fromJson factory not implemented");
  }
}
