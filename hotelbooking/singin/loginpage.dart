import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final storage = FlutterSecureStorage();
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  // Load profile image from storage
  Future<void> _loadProfileImage() async {
    final imagePath = await storage.read(key: 'profile_image');
    if (imagePath != null) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  Future<void> loginUser(BuildContext context) async {
    final url = Uri.parse('http://localhost:8080/login'); // Update to your server's URL
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email.text, 'password': password.text}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final token = responseData['token'];

      // Decode JWT to get 'sub' and 'role'
      Map<String, dynamic> payload = Jwt.parseJwt(token);
      String sub = payload['sub'];
      String role = payload['role'];

      // Store token, sub, and role securely
      await storage.write(key: 'token', value: token);
      await storage.write(key: 'sub', value: sub);
      await storage.write(key: 'role', value: role);

      print('Login successful. Sub: $sub, Role: $role');
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      print('Login failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff2B1836),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
              child: _profileImage == null ? Icon(Icons.person, size: 40) : null,
            ),
            SizedBox(height: 20),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}