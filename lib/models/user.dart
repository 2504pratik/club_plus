import 'activity.dart';

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String profilePicUrl;
  final List<Activity>? activities;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profilePicUrl,
    this.activities,
  });
}
