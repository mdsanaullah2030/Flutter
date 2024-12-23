import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners for the entire body
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Ensure the clipping matches the container
        child: Scaffold(
          backgroundColor: Colors.transparent, // Make the Scaffold transparent to show the blue background
          body: Row(
            children: [
              // Sidebar Menu
              Container(
                width: 100,
                decoration: BoxDecoration(
                // Slightly darker blue for sidebar
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 40),
                        // Home - Selected with Highlight
                        _buildSidebarItem(
                          icon: Icons.home,
                          label: "Home",
                          isSelected: true,
                        ),
                        _buildSidebarItem(icon: Icons.person, label: "Profile"),
                        _buildSidebarItem(icon: Icons.location_on, label: "Nearby"),
                        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
                        _buildSidebarItem(icon: Icons.bookmark, label: "Bookmark"),
                        _buildSidebarItem(icon: Icons.notifications, label: "Notification"),
                        _buildSidebarItem(icon: Icons.message, label: "Message"),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
                        _buildSidebarItem(icon: Icons.settings, label: "Setting"),
                        _buildSidebarItem(icon: Icons.help, label: "Help"),
                        _buildSidebarItem(icon: Icons.logout, label: "Logout"),
                        SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarItem({
    required IconData icon,
    required String label,
    bool isSelected = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: isSelected
          ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      )
          : null,
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.white,
            size: 20,
          ),
          if (!isSelected) SizedBox(width: 10),
          if (!isSelected)
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
