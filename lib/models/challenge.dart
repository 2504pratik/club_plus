enum ActivityType { running, swimming, cycling, hiking }

class Challenge {
  final String challengeId;
  final String challengeTitle;
  final DateTime startDate;
  final DateTime endDate;
  final ActivityType activityType;
  final String desc;

  // Constructor
  Challenge({
    required this.challengeId,
    required this.challengeTitle,
    required this.startDate,
    required this.endDate,
    required this.activityType,
    required this.desc,
  });

  // Constructor to initialize from JSON
  Challenge.fromJson(Map<String, dynamic> json)
      : challengeId = json['challengeId'],
        challengeTitle = json['challengeTitle'],
        startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        activityType = _parseActivityType(json['activityType']),
        desc = json['desc'];

  // Helper function to parse ActivityType
  static ActivityType _parseActivityType(String type) {
    switch (type) {
      case 'running':
        return ActivityType.running;
      case 'swimming':
        return ActivityType.swimming;
      case 'cycling':
        return ActivityType.cycling;
      case 'hiking':
        return ActivityType.hiking;
      default:
        throw ArgumentError('Invalid activity type: $type');
    }
  }
}
