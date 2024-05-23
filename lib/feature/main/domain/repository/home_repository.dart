import 'package:dartz/dartz.dart';
import 'package:dokterian_test/feature/main/domain/dto/doctor_nearby.dart';

abstract interface class HomeRepository {
  Future<Either<String, DoctorNearby>> getNearbyDoctor();
}
