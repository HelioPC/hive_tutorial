import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';

class TripLocaDataSource {
  final Box<TripModel> tripBox;

  TripLocaDataSource({required this.tripBox});

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(String id) {
    tripBox.delete(id);
  }
}