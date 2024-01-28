import 'package:flutter/material.dart';

class warrior_ride_app extends StatelessWidget {
  const warrior_ride_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.21, 0.98),
            end: Alignment(0.21, -0.98),
            colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 30,
              child: Container(
                width: 370,
                height: 60,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.03),
                    end: Alignment(1, -0.03),
                    colors: [Color(0xFF36AB00), Color(0xFF00DE65)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: [
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
              left: 128,
              top: 35,
              child: SizedBox(
                width: 175,
                height: 60,
                child: Text(
                  'Your Ride',
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
            Positioned(
              left: 10,
              top: 300,
              child: Container(
                width: 380,
                height: 573,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.55, 0.84),
                    end: Alignment(0.55, -0.84),
                    colors: [Color(0xFFE1E1E1), Colors.white],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  shadows: [
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
              left: 49,
              top: 320,
              child: Container(
                width: 312,
                height: 76,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.07),
                    end: Alignment(1, -0.07),
                    colors: [Color(0xFF2DB411), Color(0xFF00FF73)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
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
              left: 43,
              top: 530,
              child: Container(
                width: 311,
                height: 70,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.07),
                    end: Alignment(1, -0.07),
                    colors: [Color(0xFF2DB411), Color(0xFF00FF73)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
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
              left: 49,
              top: 425,
              child: Container(
                width: 312,
                height: 80,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.07),
                    end: Alignment(1, -0.07),
                    colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
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
              left: 49,
              top: 638,
              child: Container(
                width: 312,
                height: 200,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.00, 0.07),
                    end: Alignment(1, -0.07),
                    colors: [Color(0xFFFF6C03), Color(0xFFFFB700)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
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
              top: 335,
              child: SizedBox(
                width: 191,
                height: 56,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Vehicle ID:\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        // text: '415002SB',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 120,
              top: 648,
              child: SizedBox(
                width: 191,
                height: 56,
                child: Text(
                  'Capacity',
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
            Positioned(
              left: 100,
              top: 543,
              child: SizedBox(
                width: 191,
                height: 56,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'No. Plate:\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        // text: 'MH 11 yZ 6666',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 77,
              top: 440,
              child: SizedBox(
                width: 283,
                height: 56,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Vehicle Model:\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        // text: 'TATA Ace',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 90,
              child: Container(
                width: 354,
                height: 251,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/report warrior.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 106,
              top: 700,
              child: SizedBox(
                width: 88,
                height: 103,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Wet\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '500 kg',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 242,
              top: 700,
              child: SizedBox(
                width: 88,
                height: 103,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Dry\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '500 Kg',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 110,
              top: 780,
              child: SizedBox(
                width: 218,
                height: 39,
                child: Text(
                  'Total: 1000 Kg',
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
          ],
        ),
      ),
    );
  }
}
