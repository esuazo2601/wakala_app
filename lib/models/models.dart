class UserModel {
  final String user;
  final String password;

  const UserModel({
    required this.user,
    required this.password,
  });

  toJson() {
    return {"user": user, "password": password};
  }
}
