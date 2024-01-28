import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/components/first_app_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../components/background.dart';
import '../../responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: WelcomeImage(),
                ),
              ],
            ),
            mobile: MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          const Positioned(
            left: -15,
            top: 435,
            child: SizedBox(
              width: 461,
              height: 203,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome To ',
                      style: TextStyle(
                        color: Color(0xFFFF8900),
                        fontSize: 55,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text: 'EcoRoute',
                      style: TextStyle(
                        color: Color(0xFF00BD56),
                        fontSize: 80,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w200,
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
            left: 44,
            top: 92,
            child: Container(
              width: 341,
              height: 322,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login.png"),
                  fit: BoxFit.fill,
                ),
                //   boxShadow: [
                //  BoxShadow(
                //       color: Color(0x3F000000),
                //       blurRadius: 4,
                //       offset: Offset(0, 4),
                //       spreadRadius: 0,
                //     ),
                //   ],
              ),
              // child: SvgPicture.asset(
              //   'assets/images/vehicle.svg', // Path to your SVG image
              //   fit: BoxFit.contain,
              // ),
            ),
          ),
          const Positioned(
            left: 0,
            top: 702,
            child: SizedBox(
              width: 430,
              height: 72,
              child: Text(
                'Never Worry About Missed Garbage Pickups Again with EcoRoute',
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
          const Positioned(
            left: 65,
            top: 313,
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
          Positioned(
            left: 124,
            top: 819,
            child: GestureDetector(
              onTap: () {
                // Redirect to the login form page when "Get Started" is tapped
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const first_app_page();
                    },
                  ),
                );
              },
              child: Container(
                width: 184,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFF3BB403),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
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
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomeImage(); // Only display the WelcomeImage in the mobile version
  }
}
