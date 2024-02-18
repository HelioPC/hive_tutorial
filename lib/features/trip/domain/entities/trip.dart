class Trip {
  final String id;
  final String title;
  final List<String> images;
  final String description;
  final DateTime date;
  final String location;

  Trip({
    required this.id,
    required this.title,
    required this.images,
    required this.description,
    required this.date,
    required this.location,
  });
}
