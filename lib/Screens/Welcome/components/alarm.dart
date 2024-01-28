import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/globals.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay _startAlarm = TimeOfDay.now();
  TimeOfDay _endAlarm = TimeOfDay.now();
  final List<bool> _selectedDays = List.filled(7, false); // Sunday to Saturday

  void _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _startAlarm : _endAlarm,
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _startAlarm = pickedTime;
        } else {
          _endAlarm = pickedTime;
        }
      });
    }
  }

  void _showDoneDialog(BuildContext context) {
    String selectedDays = '';
    List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    for (int i = 0; i < _selectedDays.length; i++) {
      if (_selectedDays[i]) {
        selectedDays += '${daysOfWeek[i]} ';
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alarm Set'),
          content: Text(
            'Alarm set from ${_startAlarm.format(context)} to ${_endAlarm.format(context)} on $selectedDays',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _saveToFirestore() async {
    String selectedDays = '';
    List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    for (int i = 0; i < _selectedDays.length; i++) {
      if (_selectedDays[i]) {
        selectedDays += '${daysOfWeek[i]} ';
      }
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> data = {
      'startAlarm': _startAlarm.format(context),
      'endAlarm': _endAlarm.format(context),
      'selectedDays': selectedDays.trim(),
    };
    final userUid = GlobalData.currentUserUid;
    await firestore.collection('useralarm').doc(userUid).set(data);

    _showDoneDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Alarm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Time: ${_startAlarm.format(context)} to ${_endAlarm.format(context)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context, true),
              child: const Text(
                'Set Start Time',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context, false),
              child: const Text(
                'Set End Time',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Days:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  7,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          _selectedDays[index] = !_selectedDays[index];
                        });
                      },
                      shape: const CircleBorder(),
                      fillColor:
                          _selectedDays[index] ? Colors.blue : Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          [
                            'Sun',
                            'Mon',
                            'Tue',
                            'Wed',
                            'Thu',
                            'Fri',
                            'Sat'
                          ][index],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveToFirestore();
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
