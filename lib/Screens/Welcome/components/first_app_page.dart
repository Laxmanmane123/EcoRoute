import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Login/login_warrior.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class first_app_page extends StatelessWidget {
  const first_app_page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Connect"),
        backgroundColor: Color(0xFFF5860C),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FractionallySizedBox(
                  widthFactor: screenWidth > 430 ? 430 / screenWidth : 1,
                  child: Container(
                    width: 430,
                    height: 932,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 46,
                          top: 364,
                          child: SizedBox(
                            width: 343,
                            height: 203,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Welcome To ',
                                    style: TextStyle(
                                      color: Color(0xFFFF8900),
                                      fontSize: 48,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'EcoRoute',
                                    style: TextStyle(
                                      color: Color(0xFF00BD56),
                                      fontSize: 64,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 235,
                          top: 675,
                          child: Container(
                            width: 150,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: Color(0xFF3BB403),
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
                          ),
                        ),
                        Positioned(
                          left: 240,
                          top: 684,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const signup_citizen_screen();
                                  },
                                ),
                              );
                            },
                            child: const SizedBox(
                              width: 140,
                              height: 40,
                              child: Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 239,
                          top: 812,
                          child: Container(
                            width: 150,
                            height: 60,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF3BB403),
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
                          ),
                        ),
                        Positioned(
                          left: 244,
                          top: 822,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const signup_waste_worrier_screen();
                                  },
                                ),
                              );
                            },
                            child: const SizedBox(
                              width: 140,
                              height: 40,
                              child: Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 44,
                          top: 675,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return login_screen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 60,
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
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 44,
                          top: 812,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreenWarrior();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 60,
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
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      
                        Positioned(
                          left: 45,
                          top: 55,
                          child: Container(
                            width: 341,
                            height: 322,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/login.png"),
                                fit: BoxFit.fill,
                              ),
                              // boxShadow: [
                              //     BoxShadow(
                              //         color: Color(0x3F000000),
                              //         blurRadius: 4,
                              //         offset: Offset(0, 4),
                              //         spreadRadius: 0,
                              //     )
                              // ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 36,
                          top: 541,
                          child: SizedBox(
                            width: 359,
                            height: 78,
                            child: Text(
                              'Never Worry About Missed Garbage Pickups Again with EcoRoute',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 44,
                          top: 630,
                          child: SizedBox(
                            width: 341,
                            height: 35,
                            child: Text(
                              'For Eco-Citizens',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 44,
                          top: 770,
                          child: SizedBox(
                            width: 345,
                            height: 35,
                            child: Text(
                              'For Waste Worriers',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 66,
                          top: 274,
                          child: SizedBox(
                            width: 96,
                            height: 28,
                            child: Text(
                              'EcoRoute',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF031299),
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
