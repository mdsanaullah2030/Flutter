class User {

  final String name;
  final String email;
  final String password;
  final String? phoneNo;
  final String? customer;
  final String? reseller;
  final String? username;
  final bool active;
  final bool isLock;
  final String role;

  User({

    required this.name,
    required this.email,
    required this.password,
    this.phoneNo,
    this.customer,
    this.reseller,
    this.username,
    required this.active,
    required this.isLock,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      name: json['name'] ?? '',
      email: json['email'],
      password: json['password'],
      phoneNo: json['phoneNo'],
      customer: json['customer'],
      reseller: json['reseller'],
      username: json['username'],
      active: json['active'],
      isLock: json['isLock'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {

      'name': name,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
      'customer': customer,
      'reseller': reseller,
      'username': username,
      'active': active,
      'isLock': isLock,
      'role': role,
    };
  }
}
