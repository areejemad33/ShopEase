class UserModel {
  final String name;
  final String email;
  final String password;
  final String profileImage;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.profileImage = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "profileImage": profileImage,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
      profileImage: json["profileImage"] ?? "",
    );
  }
}
