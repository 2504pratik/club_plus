import 'challenge.dart';
import 'user.dart';

class Club {
  final String clubId;
  final String clubName;
  final String description;
  final List<User> members;
  final List<Challenge> challenges;

  Club({
    required this.clubId,
    required this.clubName,
    required this.description,
    required this.members,
    required this.challenges,
  });
}
