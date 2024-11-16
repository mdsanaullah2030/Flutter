import 'package:flutter/material.dart';
import 'package:hotelbooking/model/booking.dart';
import 'package:intl/intl.dart'; // Import date formatting
// Import the Booking class

class UpdateBookingPage extends StatefulWidget {
  final Booking booking;

  const UpdateBookingPage({Key? key, required this.booking}) : super(key: key);

  @override
  State<UpdateBookingPage> createState() => _UpdateBookingPageState();
}

class _UpdateBookingPageState extends State<UpdateBookingPage> {
  late TextEditingController hotelNameController;
  late TextEditingController roomTypeController;
  late TextEditingController checkinDateController;
  late TextEditingController checkoutDateController;
  late TextEditingController totalPriceController;
  late TextEditingController userNameController;
  late TextEditingController userEmailController;

  @override
  void initState() {
    super.initState();

    DateFormat dateFormat = DateFormat('yyyy-MM-dd'); // Specify date format

    // Parse dates from String to DateTime if needed and format them
    DateTime checkinDate = DateTime.tryParse(widget.booking.checkindate as String) ?? DateTime.now();
    DateTime checkoutDate = DateTime.tryParse(widget.booking.checkoutdate as String) ?? DateTime.now().add(Duration(days: 1));

    // Initialize controllers with booking data and formatted dates
    hotelNameController = TextEditingController(text: widget.booking.hotelName);
    roomTypeController = TextEditingController(text: widget.booking.roomType);
    checkinDateController = TextEditingController(text: dateFormat.format(checkinDate));
    checkoutDateController = TextEditingController(text: dateFormat.format(checkoutDate));
    totalPriceController = TextEditingController(text: widget.booking.totalprice.toString());
    userNameController = TextEditingController(text: widget.booking.userName);
    userEmailController = TextEditingController(text: widget.booking.userEmail);
  }

  @override
  void dispose() {
    hotelNameController.dispose();
    roomTypeController.dispose();
    checkinDateController.dispose();
    checkoutDateController.dispose();
    totalPriceController.dispose();
    userNameController.dispose();
    userEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: hotelNameController,
              decoration: const InputDecoration(labelText: "Hotel Name"),
            ),
            TextField(
              controller: roomTypeController,
              decoration: const InputDecoration(labelText: "Room Type"),
            ),
            TextField(
              controller: checkinDateController,
              decoration: const InputDecoration(labelText: "Check-in Date"),
            ),
            TextField(
              controller: checkoutDateController,
              decoration: const InputDecoration(labelText: "Check-out Date"),
            ),
            TextField(
              controller: totalPriceController,
              decoration: const InputDecoration(labelText: "Total Price"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(labelText: "User Name"),
            ),
            TextField(
              controller: userEmailController,
              decoration: const InputDecoration(labelText: "User Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Updated Hotel: ${hotelNameController.text}");
                print("Updated Room Type: ${roomTypeController.text}");
                print("Updated Check-in Date: ${checkinDateController.text}");
                print("Updated Check-out Date: ${checkoutDateController.text}");
                print("Updated Total Price: ${totalPriceController.text}");
                print("Updated User Name: ${userNameController.text}");
                print("Updated User Email: ${userEmailController.text}");
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
