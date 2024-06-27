import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/first_app_page.dart';
import 'package:flutter_auth/Screens/Welcome/components/report_app.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';
import 'package:flutter_auth/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(UserRequestPage());
}

class UserRequestPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController garbageDescriptionController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const first_app_page()),
        (route) => false,
      );
    } catch (e) {
      // Handle error if any
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pick Up My Garbage',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pickup Request'),
          centerTitle: true,
          backgroundColor: Colors.orange,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _handleLogout(
                  context), // Call the logout function on button press
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
                child: Text(
                  'Hi!!!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  // Navigate to the home page or perform any action
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => first_app_page()),
                  ); // Closes the drawer
                },
              ),
              ListTile(
                title: const Text('Login'),
                onTap: () {
                  // Navigate to the profile page or perform any action
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login_screen()),
                  ); // Closes the drawer
                },
              ),
              ListTile(
                title: const Text('Sign-up'),
                onTap: () {
                  // Navigate to the profile page or perform any action
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const signup_citizen_screen()),
                  ); // Closes the drawer
                },
              ),
              ListTile(
                title: const Text('Report'),
                onTap: () {
                  // Navigate to the profile page or perform any action
                  Navigator.pop(context); // Closes the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportPage()),
                  ); // Closes the drawer
                },
              ), // Add more ListTile widgets for additional pages
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Phone Number:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!isValidPhoneNumber(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  'Garbage Description:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: garbageDescriptionController,
                  maxLines: 3,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Address:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: addressController,
                  maxLines: 3,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitRequest(context);
                      sendSMS(); // Move the function call here
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendSMS() async {
    print('Running');
    final accountSid = 'AC2faf641161acf66d162440308bca69ee';
    final authToken = 'ca7e2014397373a39bb3dcd7700d4653';
    final twilioNumber = '+16093722092'; // Twilio phone number
    final recipientNumber = '+918380815946'; // Recipient phone number
    final messageBody =
        'You have got a Pickup Request please check in EcoRoute App';

    final url = Uri.parse(
        'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      },
      body: {
        'To': recipientNumber,
        'From': twilioNumber,
        'Body': messageBody,
      },
    );

    if (response.statusCode == 201) {
      print('SMS sent successfully');
    } else {
      print('Failed to send SMS: ${response.body}');
    }
  }

  Future<void> submitRequest(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_pickup')
          .doc(GlobalData.currentUserUid)
          .set({
        'phoneNumber': phoneNumberController.text,
        'garbageDescription': garbageDescriptionController.text,
        'address': addressController.text,
        'status': 'pending',
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Request Submitted'),
            content: Text(
                'SMS Sent Succefully to nearest Garbage Collector Vehicle.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error submitting request: $e');
    }
  }

  bool isValidPhoneNumber(String value) {
    // Simple validation to check if the phone number contains only digits
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }
}
