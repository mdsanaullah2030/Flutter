import 'package:capnest/productorderpage/ProductOrderPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('CapNEST', style: TextStyle(color: Colors.green)),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(Icons.tune, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Breadcrumb
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Text("Home > ", style: TextStyle(color: Colors.grey)),
                  Text("Cosmetics > ", style: TextStyle(color: Colors.grey)),
                  Text("Facewash", style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),

            // Product Image & Thumbnails
            // Product Image & Thumbnails
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  child: Column(
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQapWtOj5t_B2OQre_90RL-aQqfhEjbz3FnxA&s', // Replace with actual thumb URLs
                          height: 40,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQapWtOj5t_B2OQre_90RL-aQqfhEjbz3FnxA&s', // Replace with actual main product URL
                    height: 180,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                  ),
                ),
              ],
            ),


            const SizedBox(height: 10),
            const Text("XYZ Daily Face Wash", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(5)),
              child: const Text("499 Tk", style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 10),

            // Icons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(children: [Icon(Icons.bar_chart), Text("Profit 250 Tk")]),
                  Column(children: [Icon(Icons.access_time), Text("6 Months")]),
                  Column(children: [Icon(Icons.redeem), Text("Earn 400 Tk")]),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Feature Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  featureButton("Product Description"),
                  featureButton("Guarantee / Warranty"),
                  featureButton("After Sales Service"),
                  featureButton("Terms & Policy"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Order Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductOrderPage(),
                      ),
                    );
                  },
                  child: const Text("ORDER NOW"),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: () {
                    // Optional: Trigger phone call or show contact info
                  },
                  icon: const Icon(Icons.phone),
                  label: const Text("Call for Order"),
                )
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget featureButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(Icons.open_in_new),
          ],
        ),
      ),
    );
  }
}