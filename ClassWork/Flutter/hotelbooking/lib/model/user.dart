import 'role.dart'; // Assuming Role is defined in a separate file
import 'token.dart'; // Assuming Token is defined in a separate file

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? cell;
  String? address;
  DateTime? dob;
  String? gender;
  String? image;
  bool? active;
  bool? lock;
  Role? role;
  List<Token>? tokens;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.cell,
    this.address,
    this.dob,
    this.gender,
    this.image,
    this.active,
    this.lock,
    this.role,
    this.tokens,
  });

  // Factory method to create a User from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      cell: json['cell'],
      address: json['address'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      gender: json['gender'],
      image: json['image'],
      active: json['active'],
      lock: json['lock'],

      tokens: json['tokens'] != null
          ? List<Token>.from(json['tokens'].map((x) => Token.fromJson(x)))
          : [],
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'cell': cell,
      'address': address,
      'dob': dob?.toIso8601String(),
      'gender': gender,
      'image': image,
      'active': active,
      'lock': lock,

      'tokens': tokens?.map((x) => x.toJson()).toList(),
    };
  }
}
