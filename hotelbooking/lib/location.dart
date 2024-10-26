import 'package:flutter/material.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  // Sample list of hotel locations
  final List<String> _allLocations = [
    'Paris',
    'London',
    'New York',
    'Tokyo',
    'Sydney',
    'Dubai',
  ];

  // List to hold filtered items
  late List<String> _filteredLocations;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredLocations = _allLocations;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredLocations = _allLocations
          .where((location) =>
          location.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Locations'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search location...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredLocations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredLocations[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


