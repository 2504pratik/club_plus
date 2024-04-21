import 'club.dart';

class User {
  final String userId;
  final String userName;
  List<Club> clubs;

  User({required this.userId, required this.userName, required this.clubs});
}
