// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(DriverPage());
// }

// class DriverPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Garbage Pickup Requests',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Garbage Pickup Requests'),
//         ),
//         body: StreamBuilder(
//           stream:
//               FirebaseFirestore.instance.collection('user_pickup').snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             if (!snapshot.hasData ||
//                 snapshot.data == null ||
//                 snapshot.data!.docs.isEmpty) {
//               return Center(
//                 child: Text('No data available'),
//               );
//             }

//             return ListView(
//               children: snapshot.data!.docs.map((doc) {
//                 var data = doc.data() as Map<String, dynamic>;
//                 var phoneNumber = data['phoneNumber'];
//                 var garbageDescription = data['garbageDescription'];
//                 var address = data['address'];
//                 var status = data['status'];
//                 var documentId = doc.id;

//                 return Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Phone Number: $phoneNumber',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text('Garbage Description: $garbageDescription'),
//                       Text('Address: $address'),
//                       Text('Status: $status'),
//                       SizedBox(height: 20.0),
//                       ElevatedButton(
//                         onPressed: () {
//                           updateStatus(documentId, 'accepted');
//                         },
//                         child: Text('Accept Request'),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           updateStatus(documentId, 'rejected');
//                         },
//                         child: Text('Reject Request'),
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Future<void> updateStatus(String documentId, String newStatus) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('user_pickup')
//           .doc(documentId)
//           .update({
//         'status': newStatus,
//       });
//       print('Status updated successfully');
//     } catch (e) {
//       print('Error updating status: $e');
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/first_app_page.dart';
import 'package:flutter_auth/Screens/Welcome/components/report_app.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_citizen.dart';

void main() {
  runApp(DriverPage());
}

class DriverPage extends StatelessWidget {
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
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
        ),
      ),
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
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('user_pickup').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('No data available'),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((doc) {
                var data = doc.data() as Map<String, dynamic>;
                var phoneNumber = data['phoneNumber'];
                var garbageDescription = data['garbageDescription'];
                var address = data['address'];
                var status = data['status'];
                var documentId = doc.id;

                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number: $phoneNumber',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Garbage Description: $garbageDescription'),
                      Text('Address: $address'),
                      Text('Status: $status'),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              updateStatus(documentId, 'accepted');
                            },
                            child: Text(
                              'Accept Request',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              updateStatus(documentId, 'rejected');
                            },
                            child: Text(
                              'Reject Request',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Future<void> updateStatus(String documentId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_pickup')
          .doc(documentId)
          .update({
        'status': newStatus,
      });
      print('Status updated successfully');
    } catch (e) {
      print('Error updating status: $e');
    }
  }
}
