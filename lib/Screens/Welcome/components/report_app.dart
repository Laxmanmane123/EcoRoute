import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/home_page_app.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';
import 'package:flutter_auth/globals.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? selectedOption;
  TextEditingController descriptionController = TextEditingController();

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Any Problem ???'),
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
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homeapp()),
                );
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => login_screen()),
                );
              },
            ),
            ListTile(
              title: const Text('Sign-up'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => signup_citizen_screen()),
                );
              },
            ),
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
                        path: "+91-8380815946",
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
                left: 70,
                top: 620,
                child: Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 40,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (newRating) {
                        setState(() {
                          rating = newRating;
                        });
                        _saveRatingToFirestore(newRating);
                        _showRatingSubmittedDialog();
                      },
                    ),
                  ],
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
                  child: TextField(
                    controller: descriptionController,
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
              Positioned(
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
              Positioned(
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
                    top: 260,
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
                            value: 'Tipper Misbehaviour',
                            child: Text('Tipper Misbehaviour'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Tipper Late Arrival',
                            child: Text('Tipper Late Arrival'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Garbage Overflow',
                            child: Text('Garbage Overflow'),
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
                              value: 'Tipper Misbehaviour',
                              child: Text('Tipper Misbehaviour',
                                  style: TextStyle(fontSize: 25)),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Tipper Late Arrival',
                              child: Text('Tipper Late Arrival',
                                  style: TextStyle(fontSize: 24)),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Garbage Overflow',
                              child: Text('Garbage Overflow',
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
              Positioned(
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

  void _showRatingSubmittedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rating Submitted'),
        content: Text('Your rating has been submitted.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _saveRatingToFirestore(double newRating) {
    FirebaseFirestore.instance
        .collection('userfeedback')
        .doc(GlobalData.currentUserUid)
        .set({'rating': newRating}, SetOptions(merge: true)).then((_) {
      print('Thank you');
    }).catchError((error) {
      print('Error saving rating: $error');
    });
  }

  Future<void> sendEmail() async {
    const String apiKey =
        'Rplace With your Api key';
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
