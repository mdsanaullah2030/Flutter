import 'package:capnest/productdetailpage/ProductDetailPage.dart';
import 'package:capnest/registation/UserRegistrationPage.dart';
import 'package:capnest/walletpage/WalletPage.dart';
import 'package:flutter/material.dart';
import 'package:capnest/homepage/service/CategoryService.dart';
import 'package:capnest/homepage/model/Category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  List<Category> _categories = [];
  bool _isLoading = true;

  final List<Map<String, dynamic>> products = [
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
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
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
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final fetchedCategories = await CategoryService().fetchCategories();
      setState(() {
        _categories = fetchedCategories;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              accountName: const Text("MD SANAULLAH"),
              accountEmail: const Text("john@example.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/158471899?v=4"),
              ),
            ),
            ListTile(leading: const Icon(Icons.dashboard), title: const Text('Dashboard'), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.person), title: const Text('Profile'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserRegistrationPage()))),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Wallet'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletPage()));
              },
            ),
            ListTile(leading: const Icon(Icons.notifications), title: const Text('Notifications'), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.card_giftcard), title: const Text('Referral Code'), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.call), title: const Text('Call Center'), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.help), title: const Text('Help'), onTap: () => Navigator.pop(context)),
            ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
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
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.green),
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    ),
                    const Text('CapNEST', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                    const Spacer(),
                    const CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.tune, color: Colors.white))
                  ],
                ),
              ),

              // Promo Banner
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Buy Once, Earn\nProfit for 10 Years!',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text('Cash on Delivery | Genuine Products\nMRP Pricing Guaranteed',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),

              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: const [Text('Available Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))]),
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        _categories[index].categoryName,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage()));
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
                                  Text(product["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text(product["price"], style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
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
