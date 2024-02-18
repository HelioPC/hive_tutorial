import 'package:dartz/dartz.dart';
import 'package:travel_app/core/error/Failure.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocaDataSource localDataSource;

  TripRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);

    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(String id) async {
    localDataSource.deleteTrip(id);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final tripModels = localDataSource.getTrips();
      List<Trip> res = tripModels.map((e) => e.toEntity()).toList();

      return Right(res);
    } catch (e) {
      return Left(SomeSpecificError(message: e.toString()));
    }
  }

}