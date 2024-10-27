import 'dart:convert';
import 'package:hotelbooking/hotellist.dart';
import 'package:http/http.dart' as http;

class HotelService {
  final String apiUrl = 'http://192.168.x.x:8080/api/hotel/'; // Replace with your IP

  Future<List<Hotel>> fetchHotels() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> hotelJson = json.decode(response.body);
        return hotelJson.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load hotels');
      }
    } catch (e) {
      print('Error fetching hotels: $e');
      rethrow;
    }
  }
}