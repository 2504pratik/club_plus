class User {
  late int userId;
  late String userName;

  // Getters
  int get getUserId => userId;

  String get getUserName => userName;

  // Setters
  set setUserId(int value) {
    userId = value;
  }

  set setUserName(String value) {
    userName = value;
  }

  // Constructor
  User(int userId, String userName) {
    this.userId = userId;
    this.userName = userName;
  }
}
