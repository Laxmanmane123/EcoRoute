import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/globals.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geodesy/geodesy.dart' as geodesy;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'package:intl/intl.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Location _locationController = Location();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pApplePark = LatLng(37.3346, -122.0090);
  LatLng? _currentP = null;

  Map<PolylineId, Polyline> polylines = {};
  Set<Marker> markers = {};
  bool isAlarmPlaying = false;

  double _radius = 200.0; // Default Radius
  geodesy.Geodesy geodesyCalculator = geodesy.Geodesy();
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Load the initial radius value from Firestore
    loadRadiusFromFirestore().then((radius) {
      setState(() {
        _radius = radius ?? 200.0; // Use a default value if the radius is null
      });

      getLocationUpdates().then(
        (_) => {
          getPolylinePoints().then((coordinates) => {
                generatePolyLineFromPoints(coordinates),
              }),
        },
      );

      loadDriverLocation();
      // fetchUserAlarmData();
    });
  }

// Helper function to parse time string into TimeOfDay
  TimeOfDay? _parseTimeString(String timeStr) {
    try {
      // Parse time string into DateTime
      DateTime parsedTime = DateFormat.jm().parse(timeStr);
      // Convert DateTime to TimeOfDay
      return TimeOfDay.fromDateTime(parsedTime);
    } catch (e) {
      print('Error parsing time string: $timeStr');
      return null; // Handle parsing error gracefully
    }
  }

  Future<void> fetchUserAlarmData() async {
    try {
      final userUid = GlobalData.currentUserUid;

      print("Helli");
      if (userUid != null) {
        final userAlarmRef =
            FirebaseFirestore.instance.collection('useralarm').doc(userUid);

        DocumentSnapshot snapshot = await userAlarmRef.get();

        if (snapshot.exists) {
          // If the document exists, fetch the 'startAlarm', 'endAlarm', and 'selectedDays' fields
          TimeOfDay startAlarm = TimeOfDay.fromDateTime(
            DateFormat.jm().parse(snapshot['startAlarm']),
          );
          TimeOfDay endAlarm = TimeOfDay.fromDateTime(
            DateFormat.jm().parse(snapshot['endAlarm']),
          );
          List<String> selectedDays = snapshot['selectedDays'].split(' ');

          // Check if the current day and time match the alarm settings
          if (_isCurrentDaySelected(selectedDays) &&
              _isCurrentTimeInRange(startAlarm, endAlarm)) {
            _playAlarm();
            Fluttertoast.showToast(
              msg: "Driver is in radius!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        }
      }
    } catch (error) {
      print('Error fetching user alarm data: $error');
    }
  }

  bool _isCurrentDaySelected(List<String> selectedDays) {
    // Check if the current day is in the list of selected days
    String currentDay = DateFormat('E').format(DateTime.now());
    return selectedDays.contains(currentDay);
  }

  bool _isCurrentTimeInRange(TimeOfDay start, TimeOfDay end) {
    // Check if the current time is within the specified range
    TimeOfDay currentTime = TimeOfDay.now();

    int currentMinutes = currentTime.hour * 60 + currentTime.minute;
    int startMinutes = start.hour * 60 + start.minute;
    int endMinutes = end.hour * 60 + end.minute;

    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Location'),
      ),
      body: _currentP == null
          ? const Center(
              child: Text("Loading..."),
            )
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onMapCreated: ((GoogleMapController controller) =>
                        _mapController.complete(controller)),
                    initialCameraPosition: const CameraPosition(
                      target: _pGooglePlex,
                      zoom: 17,
                    ),
                    mapType: MapType.satellite,
                    markers: markers,
                    polylines: Set<Polyline>.of(polylines.values),
                    circles: <Circle>{
                      Circle(
                        circleId: const CircleId("userRadius"),
                        center: _currentP!,
                        radius: _radius,
                        fillColor: Colors.blue.withOpacity(0.3),
                        strokeWidth: 1,
                        strokeColor: Colors.blue,
                      ),
                    },
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _stopAlarm();
                  },
                  child: const Icon(Icons.stop),
                ),
              ],
            ),
    );
  }

  // User Radius Code
  Future<double?> loadRadiusFromFirestore() async {
    try {
      final userUid = GlobalData.currentUserUid;

      if (userUid != null) {
        final userRadiusRef =
            FirebaseFirestore.instance.collection('userradius').doc(userUid);

        DocumentSnapshot snapshot = await userRadiusRef.get();

        if (snapshot.exists) {
          // If the document exists, fetch the 'radius' field value
          return snapshot['radius'] as double?;
        }
      }

      return null; // Return null if the document or field doesn't exist
    } catch (error) {
      print('Error loading radius from Firestore: $error');
      return null;
    }
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 17,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
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

          markers.add(Marker(
            markerId: const MarkerId("_currentLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _currentP!,
          ));

          checkDriverProximity();
        });
      }
    });
  }

  // Get Driver Real time
  void checkDriverProximity() {
    for (Marker driverMarker in markers) {
      if (driverMarker.markerId.value == "_driverLocation") {
        num distance = geodesyCalculator.distanceBetweenTwoGeoPoints(
          geodesy.LatLng(_currentP!.latitude, _currentP!.longitude),
          geodesy.LatLng(
              driverMarker.position.latitude, driverMarker.position.longitude),
        );

        if (distance <= _radius && !isAlarmPlaying) {
          // _playAlarm();
          fetchUserAlarmData();
          // Fluttertoast.showToast(
          //   msg: "Driver is in radius!",
          //   toastLength: Toast.LENGTH_SHORT,
          //   gravity: ToastGravity.CENTER,
          //   timeInSecForIosWeb: 1,
          //   backgroundColor: Colors.blue,
          //   textColor: Colors.white,
          //   fontSize: 16.0,
          // );
        }
      }
    }
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
        color: const Color.fromARGB(255, 0, 0, 0),
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }

  void loadDriverLocation() {
    _firestore.collection('driverlocation').snapshots().listen((event) {
      event.docs.forEach((DocumentSnapshot doc) {
        double lat = doc['latitude'];
        double lon = doc['longitude'];

        markers.add(Marker(
          markerId: const MarkerId("_driverLocation"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: LatLng(lat, lon),
        ));
      });
    });
  }

  Future<void> _playAlarm() async {
    await player.setAsset('assets/audio/ecosound.mp3');
    await player.play();
    setState(() {
      isAlarmPlaying = true;
    });
  }

  void _stopAlarm() {
    if (isAlarmPlaying) {
      player.stop();
      setState(() {
        isAlarmPlaying = false;
      });
    }
  }
}
