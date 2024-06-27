import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_warrior.dart';
import 'package:flutter_auth/Screens/Welcome/components/driver_req.dart';
import 'package:flutter_auth/Screens/Welcome/components/first_app_page.dart';
import 'package:flutter_auth/Screens/Welcome/components/home_warrior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';
import 'package:flutter_auth/Screens/Welcome/components/warrior_report.dart';

class warrior_screen extends StatelessWidget {
  const warrior_screen({Key? key}) : super(key: key);

  // Helper function to handle user logout
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5860C),
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
            ListTile(
              title: const Text('Report'),
              onTap: () {
                // Navigate to the profile page or perform any action
                Navigator.pop(context); // Closes the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Warrior_reportapp()),
                ); // Closes the drawer
              },
            ), // Add more ListTile widgets for additional pages
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.21, 0.98),
              end: Alignment(0.21, -0.98),
              colors: [Color(0xFF36AB00), Color(0xFF90FF5C)],
            ),
          ),
          // WHITE BOX
          child: Stack(
            children: [
              Positioned(
                left: 13,
                top: 340,
                child: Container(
                  width: 370,
                  height: 398,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 0.35,
                      colors: [Color(0xFFE1E1E1), Colors.white],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
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
              // Positioned(
              //   left: 223,
              //   top: 393,
              //   child: Container(
              //     width: 180,
              //     height: 80,
              //     decoration: ShapeDecoration(
              //       gradient: const RadialGradient(
              //         center: Alignment(1, 0.50),
              //         radius: 0.40,
              //         colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   left: 538,
              //   top: 731,
              //   child: Container(
              //     width: 550,
              //     height: 550,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage(""),
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   left: 30,
              //   top: 30,
              //   child: Container(
              //     width: 370,
              //     height: 60,
              //     decoration: ShapeDecoration(
              //       gradient: const RadialGradient(
              //         center: Alignment(1, 0.50),
              //         radius: 0.49,
              //         colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       shadows: const [
              //         BoxShadow(
              //           color: Color(0x3F000000),
              //           blurRadius: 4,
              //           offset: Offset(0, 4),
              //           spreadRadius: 0,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // REPORT BLOCK
              Positioned(
                left: 32,
                top: 630,
                child: Container(
                  width: 336,
                  height: 80,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 0.49,
                      colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
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
              //NEW TAB
              Positioned(
                left: 32,
                top: 500,
                child: Container(
                  width: 336,
                  height: 80,
                  decoration: ShapeDecoration(
                    gradient: const RadialGradient(
                      center: Alignment(1, 0.50),
                      radius: 0.49,
                      colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
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
                top: 510,
                child: SizedBox(
                  width: 241,
                  height: 80, // Adjust the height based on your design
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DriverPage(); // Make sure the class name is correct
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            // Wrap RichText with Expanded
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Accept \n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Accept Your Request',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: 30,
              //   top: 28,
              //   child: Container(
              //     width: 369, // Specify a width here
              //     height: 60,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return const first_app_page(); // Make sure the class name is correct
              //             },
              //           ),
              //         );
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor:
              //             const Color(0xFFFF4E03), // Set the background color to null
              //       ),
              //       child: const SizedBox(
              //         width: double
              //             .infinity, // Use this to make the button fill the container's width
              //         height: 60,
              //         child: Text(
              //           'Home',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 32,
              //             fontFamily: 'Inter',
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              //  SET RADIUS BLOCK
              Positioned(
                left: 32,
                top: 350,
                child: Container(
                  width: 340,
                  height: 90,
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
                left: 35,
                top: 362,
                child: SizedBox(
                  width: 241,
                  height: 80, // Adjust the height based on your design
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Homewarriorpage(); // Make sure the class name is correct
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            // Wrap RichText with Expanded
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Start \n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Share Your Location',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 26,
                top: 640,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Warrior_reportapp()), // Replace ReportScreen with your actual report screen widget
                    );
                  },
                  child: const SizedBox(
                    width: 165,
                    height: 57,
                    child: Center(
                      child: Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 200,
                top: 630,
                child: Container(
                  width: 180,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Report3.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // const Positioned(
              //   left: 244,
              //   top: 399,
              //   child: SizedBox(
              //     width: 140,
              //     height: 60,
              //     child: Text.rich(
              //       TextSpan(
              //         children: [
              //           TextSpan(
              //             text: 'Distance\n',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 32,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           TextSpan(
              //             text: '',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 24,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           TextSpan(
              //             text: '',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 24,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              Positioned(
                left: 50,
                top: 28,
                child: Container(
                  width: 300,
                  height: 230,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home warrior.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: 24,
              //   top: 393,
              //   child: Container(
              //     width: 182,
              //     height: 80,
              //     decoration: ShapeDecoration(
              //       gradient: const RadialGradient(
              //         center: Alignment(1, 0.50),
              //         radius: 0.40,
              //         colors: [Color(0xFFFF4E03), Color(0xFFFF8900)],
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //   ),
              // ),
              // const Positioned(
              //   left: 45,
              //   top: 399,
              //   child: SizedBox(
              //     width: 140,
              //     height: 60,
              //     child: Text.rich(
              //       TextSpan(
              //         children: [
              //           TextSpan(
              //             text: 'Time\n',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 32,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           TextSpan(
              //             text: '',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 24,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           TextSpan(
              //             text: '',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 24,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //           TextSpan(
              //             text: '',
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 24,
              //               fontFamily: 'Inter',
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              Positioned(
                left: 270,
                top: 349,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/ms.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: -100,
              //   top: 2800,
              //   child: SizedBox(
              //     width: 115,
              //     height: 21,
              //     child: Transform(
              //       transform: Matrix4.identity()
              //         ..translate(0.0, 0.0)
              //         ..rotateZ(-0.14),
              //       child: const Text(
              //         'EcoRoute',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           color: Color(0xFF031299),
              //           fontSize: 15,
              //           fontStyle: FontStyle.italic,
              //           fontFamily: 'Inter',
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   left: 32,
              //   top: 465,
              //   child: Container(
              //     width: 95,
              //     height: 100,
              //     decoration: ShapeDecoration(
              //       image: const DecorationImage(
              //         image: AssetImage("assets/images/cl.png"),
              //         fit: BoxFit.fill,
              //       ),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   left: 1,
              //   top: 300,
              //   child: SizedBox(
              //     width: 400,
              //     height: 31,
              //     child: GestureDetector(
              //       onTap: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (context) {
              //               return const MapSample(); // Make sure the class name is correct
              //             },
              //           ),
              //         );
              //       },
              //       child: const Text.rich(
              //         TextSpan(
              //           children: [
              //             TextSpan(
              //               text: 'Tap ',
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 18,
              //                 fontStyle: FontStyle.normal,
              //                 fontFamily: 'Inter',
              //                 fontWeight: FontWeight.w700,
              //               ),
              //             ),
              //             TextSpan(
              //               text:
              //                   'on the text to view live location of truck',
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 18,
              //                 fontStyle: FontStyle.normal,
              //                 fontFamily: 'Inter',
              //                 fontWeight: FontWeight.w700,
              //               ),
              //             ),
              //           ],
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
