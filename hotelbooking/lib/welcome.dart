import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffB81736),
              Color(0xff2B1836),
            ],
          ),
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start, // Aligns content to the top
          children: [
            SizedBox(height: 10), // Optional space from top
            Container(
              width: 50, // Set desired width for the image
              height: 50, // Set desired height for the image
              child: Image.network(
                "data:image/jpeg;base64,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",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text('Welcome Back',style: TextStyle(
              fontSize: 30,
              color: Colors.white
            ),),
            Container(
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: Center(child: Text('SING IN',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white

              ),),),
            ),
            SizedBox(height: 30,),

            Container(
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: Center(child: Text('SING UP',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black

              ),),),
            ),
            SizedBox(height: 30,),
            Spacer(),
            Text('Loging with Social Media',style: TextStyle(
              fontSize: 17,
              color: Colors.white
            ),),
            SizedBox(height: 15),
            Container(
              width: 130, // Set desired width for the image
              height: 35, // Set desired height for the image
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRvgrpKuombcKLhwf_wTm15PG3pZ2NZLDXKnnzjogrjBrwZRKMRVzFs7axixYPOtkRGhI&usqp=CAU",
                fit: BoxFit.cover,
              ),
            ),


            SizedBox(height: 15),


          ],
        ),
      ),
    );
  }
}
