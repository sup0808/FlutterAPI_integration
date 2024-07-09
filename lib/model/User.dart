class User {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  User(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  static User userMapper(Map<String, dynamic> user) {
    return User(
        id: user['id'] ?? 0,
        email: user['email'] ?? "",
        first_name: user['first_name'] ?? "",
        last_name: user['last_name'] ?? "",
        avatar: user['avatar'] ?? "https://reqres.in/img/faces/7-image.jpg");
  }
}
