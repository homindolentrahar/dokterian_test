import 'package:dartz/dartz.dart';
import 'package:dokterian_test/core/data/remote/api_client.dart';
import 'package:dokterian_test/feature/main/data/model/doctor_nearby_model.dart';
import 'package:dokterian_test/feature/main/data/model/doctor_schedule_model.dart';
import 'package:dokterian_test/feature/main/domain/dto/doctor_nearby.dart';
import 'package:dokterian_test/feature/main/domain/dto/doctor_schedule.dart';
import 'package:dokterian_test/feature/main/domain/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiClient client;

  HomeRepositoryImpl(this.client);

  @override
  Future<Either<String, DoctorNearby>> getNearbyDoctor() async {
    try {
      final response = await client.requestObject<DoctorNearbyModel>(
        endpoint: '/nearby',
        method: ApiMethod.post,
        body: {
          "lat": "",
          "long": "",
        },
      );

      if (response.metadata?.status == 200) {
        return right(DoctorNearby.fromModel(response.response!.data!));
      } else {
        throw response.metadata?.message ?? "error occurred";
      }
    } catch (e) {
      debugPrint("error: $e");
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<DoctorSchedule>>> getDoctorSchedules() async {
    try {
      final response = await client.requestList<DoctorScheduleModel>(
        endpoint: '/doctor',
        method: ApiMethod.post,
      );

      if (response.metadata?.status == 200) {
        return right(
          response.response?.data
                  ?.map((e) => DoctorSchedule.fromModel(e))
                  .toList() ??
              [],
        );
      } else {
        throw response.metadata?.message ?? "error occurred";
      }
    } catch (e) {
      debugPrint("error: $e");
      return left(e.toString());
    }
  }
}
