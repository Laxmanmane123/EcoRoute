// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Screens/Welcome/components/nearest_veh_loc.dart';
import 'package:flutter_auth/globals.dart';

class SetRadiusScreen extends StatefulWidget {
  @override
  _SetRadiusScreenState createState() => _SetRadiusScreenState();
}

class _SetRadiusScreenState extends State<SetRadiusScreen> {
  double selectedRadius = 50.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Radius Screen'),
        backgroundColor: Colors.greenAccent[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Radius:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              DropdownButton<double>(
                value: selectedRadius,
                items: [
                  5.0,
                  10.0,
                  20.0,
                  30.0,
                  40.0,
                  50.0,
                  100.0,
                  150.0,
                  200.0,
                  250.0,
                  300.0
                ].map((double value) {
                  return DropdownMenuItem<double>(
                    value: value,
                    child: Text('$value'),
                  );
                }).toList(),
                onChanged: (double? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedRadius = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Save selectedRadius to Firestore
                  await _saveRadiusToFirestore(selectedRadius);

                  // Handle submit action, you can add your logic here
                  print('Selected Radius: $selectedRadius');

                  // Navigate to Homeapp screen
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const MapSample();
                      },
                    ),
                  );
                },
                child: const Text('Submit',
                style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveRadiusToFirestore(double radius) async {
    try {
      final userUid =
          GlobalData.currentUserUid; // Get the UID from your GlobalData class
      if (userUid != null) {
        final userRadiusRef =
            FirebaseFirestore.instance.collection('userradius').doc(userUid);

        await userRadiusRef.set({
          'radius': radius,
        });

        print('Radius saved to Firestore: $radius');
      } else {
        print('User UID is null.');
      }
    } catch (error) {
      print('Error saving radius to Firestore: $error');
    }
  }
}
