import 'package:capnest/homepage/model/Product.dart';
import 'package:capnest/orderconfirmationpage/OrderConfirmationPage.dart';
import 'package:flutter/material.dart';

class ProductOrderPage extends StatefulWidget {
  final Product product;

  const ProductOrderPage({super.key, required this.product});

  @override
  State<ProductOrderPage> createState() => _ProductOrderPageState();
}

class _ProductOrderPageState extends State<ProductOrderPage> {
  final String imageBaseUrl = 'http://75.119.134.82:2030/images/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            FlutterLogo(),
            SizedBox(width: 8),
            Text('CapNEST', style: TextStyle(color: Colors.green)),
          ],
        ),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            Row(
              children: [
                const Text("Home > ", style: TextStyle(color: Colors.grey)),
                Text(
                  "${widget.product.category?.categoryName ?? 'Category'} > ",
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(widget.product.productname,
                    style: const TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 20),

            // Product Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.productname,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Image.network(
                  '$imageBaseUrl${widget.product.imagea}',
                  height: 150, // Set desired height
                  width: 200,  // Set desired width
                  fit: BoxFit.cover, // Adjusts how the image fits in the box
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 50),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "${widget.product.specialprice.toStringAsFixed(0)} Tk",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // Form Inputs
            buildInput("phone number"),
            buildInput("email"),
            const Text("MFS (Monthly profit disbursement account)"),
            buildDropdown(["Select one", "bKash", "Nagad", "Rocket"]),
            buildInput("personal account number"),
            buildInput("district"),
            buildInput("address"),

            const SizedBox(height: 20),

            // Payment Options
            const Text("Select Payment Option"),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS59WLB1ZRe_hwHKl3pZiRaY5fa9V8vRzaX8w&s',
                    height: 30),
                const SizedBox(width: 15),
                Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJuqjto-bR_wfpmJgTMlXiomzyEceqfPhaKQ&s',
                    height: 30),
                const SizedBox(width: 15),
                Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3ysb2JM9-m_RKKu-OcrQarxlbt-3Sq-vCRA&s',
                    height: 30),
                const SizedBox(width: 15),
                Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-C1mgU_6d-fRcTO-RQJ0KzAHXJG9inWxUkg&s',
                    height: 30),
              ],
            ),

            const SizedBox(height: 20),

            // Terms Checkbox
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Expanded(
                  child: Text(
                    "I have read, understood, and agree to comply with the CapNEST Profit Sharing Policy.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),

            // Referral Code and Submit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Referral Code",
                    style:
                    TextStyle(decoration: TextDecoration.underline)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const OrderConfirmationPage(userName: 'Alex'),
                      ),
                    );
                  },
                  child: const Text("SUBMIT"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Center(child: Text("Don't have? CALL for code")),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget buildInput(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  Widget buildDropdown(List<String> items) {
    String selected = items.first;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: selected,
            items:
            items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (_) {},
          ),
        ),
      ),
    );
  }
}
