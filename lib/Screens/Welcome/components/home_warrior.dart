import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Screens/Login/login_warrior.dart';
import 'package:flutter_auth/Screens/Welcome/components/first_app_page.dart';
import 'package:flutter_auth/Screens/Welcome/components/signup_warrior.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/globals.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Homewarriorpage extends StatefulWidget {
  const Homewarriorpage({Key? key}) : super(key: key);

  @override
  State<Homewarriorpage> createState() => _HomewarriorpageState();
}

class _HomewarriorpageState extends State<Homewarriorpage> {
  Location _locationController = Location();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints().then((coordinates) => {
              generatePolyLineFromPoints(coordinates),
            }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(GlobalData.currentUserUid);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Location'),
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
                  MaterialPageRoute(
                      builder: (context) => const first_app_page()),
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
                      builder: (context) =>
                          const signup_waste_worrier_screen()),
                ); // Closes the drawer
              },
            ),
            // Add more ListTile widgets for additional pages
          ],
        ),
      ),
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  _mapController.complete(controller)),
              initialCameraPosition: const CameraPosition(
                target: _pGooglePlex,
                zoom: 17,
              ),
              mapType: MapType.satellite,
              markers: {
                Marker(
                  markerId: const MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentP!,
                ),
                const Marker(
                    markerId: MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex),
                const Marker(
                    markerId: MarkerId("_destionationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pApplePark)
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 17,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
          _storeLocation(_currentP!.latitude, _currentP!.longitude);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }

  void _storeLocation(double latitude, double longitude) async {
    await _firestore
        .collection('driverlocation')
        .doc(GlobalData.currentUserUid)
        .set({
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: Homewarriorpage(),
  ));
}

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
