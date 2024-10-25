import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Loginpage extends StatelessWidget {

final TextEditingController email=TextEditingController();
final TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // Add your background color here
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.white,           // Font color
                    fontWeight: FontWeight.bold,  // Font weight
                    fontSize: 16,                 // Font size (optional)
                  ),
                border: OutlineInputBorder(),
                prefixIcon:Icon(Icons.email)
                    
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,           // Font color
                  fontWeight: FontWeight.bold,  // Font weight
                  fontSize: 16,                 // Font size (optional)
                ),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
              obscureText: true,
            ),

            ElevatedButton(onPressed: (){
              String em=email.text;
              String pass=password.text;
              print('Email:$em,Password:$pass');


            },
            child: Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily:GoogleFonts.lato().fontFamily
            ),
            ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,


              ),
            )
          ],
        ),
        
      ),
    );
  }
}
