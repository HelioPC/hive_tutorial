import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final List<String> images;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final String location;

  TripModel({
    required this.id,
    required this.title,
    required this.images,
    required this.description,
    required this.date,
    required this.location,
  });

  factory TripModel.fromEntity(Trip trip) => TripModel(
        id: trip.id,
        title: trip.title,
        images: trip.images,
        description: trip.description,
        date: trip.date,
        location: trip.location,
      );

  Trip toEntity() => Trip(
        id: id,
        title: title,
        images: images,
        description: description,
        date: date,
        location: location,
      );
}
