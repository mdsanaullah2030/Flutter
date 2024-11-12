import 'user.dart';

class Token {
  int? id;
  String? token;
  User? user;

  Token({this.id, this.token, this.user});

  // Factory constructor for JSON deserialization
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      id: json['id'],
      token: json['token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'user': user?.toJson(),
    };
  }
}
