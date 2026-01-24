enum UserRole {
  user,
  agent,
  admin;

  String get value => name;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (e) => e.name == value,
      orElse: () => UserRole.user,
    );
  }
}
