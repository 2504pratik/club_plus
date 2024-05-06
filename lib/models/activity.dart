class Activity {
  final double distance;
  final String sportType;
  final DateTime startDateLocal;

  Activity({
    required this.distance,
    required this.sportType,
    required this.startDateLocal,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      distance: json['distance'].toDouble(),
      sportType: json['sport_type'],
      startDateLocal: DateTime.parse(json['start_date_local']),
    );
  }
}
