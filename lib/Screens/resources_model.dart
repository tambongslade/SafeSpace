// models/resource.dart
class Resource {
  final String type;
  final double longitude;
  final double latitude;

  Resource({required this.type, required this.longitude, required this.latitude});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      type: json['type'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}
