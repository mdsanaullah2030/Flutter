import 'package:flutter/material.dart';
import 'package:hotelbooking/model/booking.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? checkinDate;
  DateTime? checkoutDate;
  TextEditingController roomTypeController = TextEditingController();
  TextEditingController hotelNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectCheckinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != checkinDate)
      setState(() {
        checkinDate = picked;
      });
  }

  Future<void> _selectCheckoutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkinDate ?? DateTime.now(),
      firstDate: checkinDate ?? DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != checkoutDate)
      setState(() {
        checkoutDate = picked;
      });
  }

  void _saveBooking() async {
    if (_formKey.currentState!.validate()) {
      final booking = Booking(
        checkindate: checkinDate,
        checkoutdate: checkoutDate,
        totalprice: int.tryParse(totalPriceController.text),
        roomType: roomTypeController.text,
        hotelName: hotelNameController.text,
        userName: userNameController.text,
        userEmail: userEmailController.text,
      );

      print("Booking Saved: ${booking.toJson()}");

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('hotelName', hotelNameController.text);
      await prefs.setString('roomType', roomTypeController.text);
      _clearDatesFromStorage();
    }
  }

  Future<void> _clearDatesFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('checkInDate');
    await prefs.remove('checkOutDate');
    setState(() {
      checkinDate = null;
      checkoutDate = null;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    checkinDate = await _getDateFromStorage('checkInDate');
    checkoutDate = await _getDateFromStorage('checkOutDate');
    final prefs = await SharedPreferences.getInstance();
    hotelNameController.text = prefs.getString('hotelName') ?? '';
    roomTypeController.text = prefs.getString('roomType') ?? '';
    setState(() {});
  }

  Future<DateTime?> _getDateFromStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final dateString = prefs.getString(key);
    if (dateString != null) {
      return DateTime.parse(dateString);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ListTile(
                title: Text("Check-in Date: ${checkinDate != null ? dateFormat.format(checkinDate!) : 'Select Date'}"),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectCheckinDate(context),
              ),
              ListTile(
                title: Text("Check-out Date: ${checkoutDate != null ? dateFormat.format(checkoutDate!) : 'Select Date'}"),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectCheckoutDate(context),
              ),
              TextFormField(
                controller: roomTypeController,
                decoration: InputDecoration(labelText: 'Room Type'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter room type' : null,
              ),
              TextFormField(
                controller: hotelNameController,
                decoration: InputDecoration(labelText: 'Hotel Name'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter hotel name' : null,
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(labelText: 'User Name'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter user name' : null,
              ),
              TextFormField(
                controller: userEmailController,
                decoration: InputDecoration(labelText: 'User Email'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter user email' : null,
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                controller: totalPriceController,
                decoration: InputDecoration(labelText: 'Total Price'),
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty ? 'Please enter total price' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveBooking,
                child: Text('Save Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
