// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Login/login_warrior.dart';

class signup_waste_worrier_screen  extends StatelessWidget {
  const signup_waste_worrier_screen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up as Waste Warrior'),
        centerTitle: true,
        backgroundColor:  const Color(0xFFF5860C),
      ),
      body: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _jobIdController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileNoController = TextEditingController();

  Future<void> _registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      // Registration successful, save additional data to Firestore
      // await FirebaseFirestore.instance.collection('warriors').doc(userCredential.user!.uid).set({
      //   'jobId': _jobIdController.text,
      //   'email': _emailController.text,
      //   'name': _nameController.text,
      //   'mobileNumber': _mobileNoController.text,
      //   // Add more data fields as needed
      // });
        await FirebaseFirestore.instance.collection('warriors').doc(userCredential.user!.uid).set({
        'jobId': _jobIdController.text,
        'email': _emailController.text,
        'name': _nameController.text,
        'mobileNumber': _mobileNoController.text,
    // Add more data fields as needed
  });

// Listen for changes in the "warriors" collection
    FirebaseFirestore.instance.collection('warriors').doc(userCredential.user!.uid).snapshots().listen((warriorSnapshot) {
      if (warriorSnapshot.exists) {
        String userId = userCredential.user!.uid;
      }
    });  

      
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signup successful!')));

      // Navigate to login_screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreenWarrior()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _jobIdController,
              decoration: const InputDecoration(labelText: 'Job ID'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Job ID';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Email';
                }
                // Add more email validation if necessary (e.g., email format)
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one uppercase letter';
                        }
                        if (!value
                            .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                          return 'Password must contain at least one special character';
                        }

                        return null;
                      },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _mobileNoController,
              decoration: const InputDecoration(labelText: 'Mobile Number'),
              validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Contact Details';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Invalid Contact Details';
                        }
                        return null;
                      },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _registerUser();
                }
              },
              child: const Text('Sign Up',
              style:TextStyle(
              color: Colors.white,
              fontSize: 24,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
