import 'package:flutter/material.dart';

class HotelLocation {
  final String name;
  final String address;
  final String imageUrl;


  HotelLocation({required this.name, required this.address, required this.imageUrl});
}

class Location extends StatelessWidget {
  // Sample list of hotel locations
  final List<HotelLocation> locations = [
    HotelLocation(
      name: "Grand Hotel",
      address: "123 Main St, Cityville",
      imageUrl: "https://example.com/image1.jpg", // Replace with valid URL
    ),
    HotelLocation(
      name: "City Inn",
      address: "456 Park Ave, Metropolis",
      imageUrl: "https://example.com/image2.jpg", // Replace with valid URL
    ),
    // Add more locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel Locations"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  location.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    location.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    location.address,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
