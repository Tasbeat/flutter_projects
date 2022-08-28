class User {
  String name;
  String username;
  String email;
  int id;
  User(this.name, this.id, this.email, this.username);

  factory User.fromMapJson(Map<String, dynamic> jsonObject) {
    return User(jsonObject['name'], jsonObject['id'], jsonObject['email'],
        jsonObject['username']);
  }
}
