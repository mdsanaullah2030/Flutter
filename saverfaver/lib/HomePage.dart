import 'package:flutter/material.dart';
import 'package:saverfaver/ProductDetailPage.dart';
import 'package:saverfaver/UserRegistrationPage.dart'; // Make sure this exists

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<String> categories = const ['Cosmetics', 'Fashion', 'Gadget', 'Trending'];

  final List<Map<String, dynamic>> products = const [
    {
      "name": "Silver Laptop",
      "price": "\$200",
      "series": "X90 Series",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8J_yZ1oKmz4dClcFpOL4tWg8L641qrEWI9g&s",
    },
    {
      "name": "Smart Watch",
      "price": "\$50",
      "series": "K9 Series",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8J_yZ1oKmz4dClcFpOL4tWg8L641qrEWI9g&s",
    },
    {
      "name": "Silver Laptop",
      "price": "\$200",
      "series": "X90 Series",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8J_yZ1oKmz4dClcFpOL4tWg8L641qrEWI9g&s",
    },
    {
      "name": "Smart Watch",
      "price": "\$50",
      "series": "K9 Series",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZUXyyIKSBbKMllRKzykzr55b18G_tSm9p_Q&s",
    },
    {
      "name": "Silver Laptop",
      "price": "\$200",
      "series": "X90 Series",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvc1jALTaoQwM1e6RyOnGERUh9ZVyE2zFU1A&s",
    },
    {
      "name": "Smart Watch",
      "price": "\$50",
      "series": "K9 Series",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS30apYYnBvYRXJ_mNUsQKQund25E7sYLQQuw&s",
    },
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      // Navigate to registration page on Profile tap
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserRegistrationPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  children: [
                    const Text('CapNEST',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.tune, color: Colors.white),
                    )
                  ],
                ),
              ),

              // Promo Banner
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buy Once, Earn\nProfit for 10 Years!',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Cash on Delivery | Genuine Products\nMRP Pricing Guaranteed',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    )
                  ],
                ),
              ),

              // Category Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    Text('Available Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              // Categories Horizontal List
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: index == 0 ? Colors.red : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Products Grid
              Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    product["image"],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product["name"],
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    product["price"],
                                    style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(product["series"], style: const TextStyle(fontSize: 12)),
                              Row(
                                children: List.generate(
                                  5,
                                      (star) => const Icon(Icons.star, size: 14, color: Colors.amber),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
