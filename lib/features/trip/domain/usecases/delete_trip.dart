import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';

class DeleteTrip {
  final TripRepository repository;

  DeleteTrip({required this.repository});

  Future<void> call(String id) {
    return repository.deleteTrip(id);
  }
}