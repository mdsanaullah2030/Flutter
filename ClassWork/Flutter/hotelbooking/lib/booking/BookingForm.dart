import 'package:flutter/material.dart';
import 'package:hotelbooking/model/booking.dart';
import 'package:hotelbooking/model/room.dart';
import 'package:hotelbooking/service/AuthService.dart';
import 'package:hotelbooking/service/room_service.dart';
import 'package:intl/intl.dart'; // For date formatting
 // RoomService for fetching room details

class CreateBookingPage extends StatefulWidget {
  final int roomId;

  CreateBookingPage({required this.roomId});

  @override
  _CreateBookingPageState createState() => _CreateBookingPageState();
}

class _CreateBookingPageState extends State<CreateBookingPage> {
  final _formKey = GlobalKey<FormState>();
  Booking booking = Booking();
  Room room = Room();
  int? totalPrice;
  TextEditingController hotelController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController totalpriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchRoomData();
    fetchUserData();
  }

  Future<void> fetchRoomData() async {
    try {
      room = await RoomService.getRoomById(widget.roomId);
      hotelController.text = room.hotelName ?? '';
      roomController.text = room.roomType ?? '';

      // Check for price
      if (room.price != null) {
        calculateTotalPrice();
      } else {
        print("Room price is missing");
      }
    } catch (e) {
      print("Error fetching room data: $e");
    }
  }

  Future<void> fetchUserData() async {
    var user = await AuthService.getCurrentUser();
    if (user != null) {
      booking.userName = user.name;
      booking.userEmail = user.email;
    }
  }

  void calculateTotalPrice() {
    if (booking.checkindate != null && booking.checkoutdate != null) {
      final days = booking.checkoutdate!.difference(booking.checkindate!).inDays;
      setState(() {
        totalPrice = days * (room.price ?? 0);
        totalpriceController.text = totalPrice.toString();
      });
    }
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      booking.hotelName = hotelController.text;
      booking.roomType = roomController.text;
      booking.totalprice = totalPrice;

      // Here, you would call your bookingService to save the booking
      // For now, we're just printing the data to verify
      print("Booking saved: ${booking.toJson()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Booking")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: hotelController,
                decoration: InputDecoration(labelText: "Hotel"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Hotel is required";
                  return null;
                },
              ),
              TextFormField(
                controller: roomController,
                decoration: InputDecoration(labelText: "Room"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Room is required";
                  return null;
                },
              ),
              TextFormField(
                controller: totalpriceController,
                decoration: InputDecoration(labelText: "Total Price"),
                readOnly: true,
              ),
              ElevatedButton(
                onPressed: onSubmit,
                child: Text("Submit Booking"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
