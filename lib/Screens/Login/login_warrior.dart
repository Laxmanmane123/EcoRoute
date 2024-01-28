import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_auth/Screens/Welcome/components/warrior_screen.dart';
import 'package:flutter_auth/globals.dart';

class LoginScreenWarrior extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      String? newUid = userCredential.user?.uid;

      // Check if the new UID is different from the current one
      if (GlobalData.currentUserUid != newUid) {
        GlobalData.currentUserUid = newUid;
        await GlobalData.saveUserUid(); // Save the UID to shared preferences
        print(GlobalData.currentUserUid);
      }

      if (userCredential.user != null) {
        if (_emailController.text.startsWith('job')) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const warrior_screen();
              },
            ),
          );
        } else {
          // Handle invalid email
        }
      } else {
        // Handle login failure
      }
    } catch (e) {
      // Handle login error
      print("Login error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFFF5860C),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 430,
            height: 932,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                const Positioned(
                  left: 56,
                  top: 21,
                  child: SizedBox(
                    width: 318,
                    height: 123,
                    child: Text(
                      'EcoRoute',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF00DE65),
                        fontSize: 64,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 500,
                  child: Container(
                    width: 340,
                    height: 65,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.grey, // Border color
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        filled: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 620,
                  child: Container(
                    width: 340,
                    height: 65,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          style: BorderStyle.solid,
                          color: Colors.grey, // Border color
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        filled: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 730,
                  child: Container(
                    width: 337,
                    height: 61,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5860C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
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
                    child: TextButton(
                      onPressed: () {
                        _signInWithEmailAndPassword(context);
                      },
                      child: const Text(
                        'Log in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 50,
                  top: 470,
                  child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                      'Username :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 50,
                  top: 590,
                  child: SizedBox(
                    width: 211,
                    height: 34,
                    child: Text(
                      'Password :',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -45,
                  top: 60,
                  child: Container(
                    width: 500,
                    height: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/7.png"),
                        fit: BoxFit.cover,
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color(0x3F000000),
                      //     blurRadius: 12,
                      //     offset: Offset(7, 11),
                      //     spreadRadius: 0,
                      //   )
                      // ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 42,
                  top: 420,
                  child: SizedBox(
                    width: 345,
                    height: 28,
                    child: Text(
                      'Waste Worrier',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
