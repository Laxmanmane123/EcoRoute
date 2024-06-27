import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_warrior.dart';
import 'package:flutter_auth/Screens/Welcome/components/first_app_page.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';
import 'package:flutter_auth/Screens/Welcome/components/warrior_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Warrior_reportapp extends StatefulWidget {
  const Warrior_reportapp({Key? key}) : super(key: key);

  @override
  State<Warrior_reportapp> createState() => _Warrior_reportappState();
}

class _Warrior_reportappState extends State<Warrior_reportapp> {
  String? selectedOption;
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Page'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[700],
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
              title: const Text('Welcome'),
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
              title: const Text('Home'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => warrior_screen()),
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
                  MaterialPageRoute(builder: (context) => LoginScreenWarrior()),
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
                      builder: (context) => signup_waste_worrier_screen()),
                ); // Closes the drawer
              },
            ),
            // Add more ListTile widgets for additional pages
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.21, -0.98),
              end: Alignment(-0.21, 0.98),
              colors: [Color(0xFFFFB700), Color(0xFFFF8900)],
            ),
          ),
          child: Stack(
            children: [
              // CONTACT US BTN
              Positioned(
                left: 33,
                top: 670,
                child: Container(
                  width: 340,
                  height: 61,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 0.35,
                      colors: [Color(0xFF3BB403), Color(0xFF00FF73)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 80,
                top: 676,
                child: SizedBox(
                  width: 265,
                  child: GestureDetector(
                    onTap: () async {
                      final Uri url = Uri(
                        scheme: 'tel',
                        path: "+9665373281",
                      );
                      if (await canLaunch(url.toString())) {
                        await launch(url.toString());
                      } else {
                        print('Cannot launch phone dialer');
                      }
                    },
                    child: const Text(
                      'Contact us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 32,
                top: 670,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/phone.jpg"),
                      fit: BoxFit.contain,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              // WHITE BOX
              Positioned(
                left: 23,
                top: 210,
                child: Container(
                  width: 350,
                  height: 400,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(-0.50, 0.87),
                      end: Alignment(0.5, -0.87),
                      colors: [Color(0xFFE4E4E4), Colors.white, Colors.white],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              // SUBMIT BTN
              Positioned(
                left: 115,
                top: 530,
                child: GestureDetector(
                  onTap: () {
                    sendEmail();
                  },
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(-1.00, 0.10),
                        end: Alignment(1, -0.1),
                        colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  width: 370,
                  height: 202,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Report3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130,
                top: 538,
                child: GestureDetector(
                  onTap: () {
                    sendEmail();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: const Text('Email sent successfully'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const SizedBox(
                    width: 134,
                    height: 56,
                    child: Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 35,
                top: 380,
                child: Container(
                  width: 320,
                  height: 104,
                  decoration: ShapeDecoration(
                    color: const Color(0x00FCF7F7),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter text here',
                      filled: false,
                      hintStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 45,
                top: 340,
                child: SizedBox(
                  width: 222,
                  height: 30,
                  child: Text(
                    'Description:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 45,
                top: 220,
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: Text(
                    'issue:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    left: 58,
                    top: 260, // Adjust the top value as needed
                    child: Container(
                      width: 280,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 68,
                    top: 260,
                    child: Container(
                      width: 320,
                      height: 60,
                      child: DropdownButton<String>(
                        value: selectedOption,
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Citizens Misbehavior',
                            child: Text('Citizens Misbehavior'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Road Block/Traffic',
                            child: Text('Road Block/Traffic'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'App Mal-functioning',
                            child: Text('App Mal-functioning'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Vehicle Malfunctioning',
                            child: Text('Vehicle Malfunctioning'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Other',
                            child: Text('Other'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Nothing',
                            child: Text('Nothing'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return const [
                            DropdownMenuItem<String>(
                              value: 'Citizens Misbehavior',
                              child: Text('Citizens Misbehavior',
                                  style: TextStyle(fontSize: 25)),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Road Block/Traffic',
                              child: Text('Road Block/Traffic',
                                  style: TextStyle(fontSize: 24)),
                            ),
                            DropdownMenuItem<String>(
                              value: 'App Mal-functioning',
                              child: Text('App Mal-functioning',
                                  style: TextStyle(fontSize: 25)),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Vehicle Malfunctioning',
                              child: Text('Vehicle Malfunctioning',
                                  style: TextStyle(fontSize: 22)),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Other',
                              child:
                                  Text('Other', style: TextStyle(fontSize: 25)),
                            ),
                          ];
                        },
                        hint: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Select Options',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Positioned(
                left: 23,
                top: 894,
                child: SizedBox(
                  width: 385,
                  height: 20,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tap ',
                          style: TextStyle(
                            color: Color(0xFFE1E1E1),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text:
                              'here to contact the authority of your respected area',
                          style: TextStyle(
                            color: Color(0xFFE1E1E1),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                left: 140,
                top: 40,
                child: SizedBox(
                  width: 134.03,
                  height: 27.35,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(1.04),
                    child: const Text(
                      'EcoRoute',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF031299),
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    const String apiKey =
        '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';
    const String fromEmail = 'vmane5785@gmail.com';
    const String toEmail = 'anujmane007@gmail.com';

    const String apiUrl = 'https://api.sendgrid.com/v3/mail/send';

    final Map<String, dynamic> data = {
      'personalizations': [
        {
          'to': [
            {'email': toEmail},
          ],
          'subject': 'Reported Issue: $selectedOption',
        }
      ],
      'from': {'email': fromEmail},
      'content': [
        {
          'type': 'text/plain',
          'value':
              'Description: ${descriptionController.text}\nSelected Option: $selectedOption'
        }
      ],
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 202) {
      print('Email sent successfully');
      Fluttertoast.showToast(
        msg: 'Email sent successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      // Add any additional logic after successful email sending
    } else {
      print('Failed to send email. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      Fluttertoast.showToast(
        msg: 'Failed to send email',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      // Handle the error as needed
    }
  }
}
