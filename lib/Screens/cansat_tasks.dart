import 'package:cansat/home.dart';
import 'package:flutter/material.dart';
import 'package:cansat/connection_folder/ssh.dart';

class CansatTaskScreen extends StatefulWidget {
  @override
  _CansatTaskScreenState createState() => _CansatTaskScreenState();
}

class _CansatTaskScreenState extends State<CansatTaskScreen> {
  late final SSH ssh;

  @override
  void initState() {
    super.initState();
    ssh = SSH();
    _connectToLG();
  }

  Future<void> _connectToLG() async {
    bool? result = await ssh.connectToLG();
    setState(() {
      connectionStatus = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CANSAT Tasks'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 40),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await _connectToLG();
                  ssh.rebootLG();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change button color to blue
                  padding: EdgeInsets.symmetric(vertical: 40), // Adjust padding as needed
                ),
                child: Text(
                  'Reboot',
                  style: TextStyle(fontSize: 30), // Adjust font size as needed
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await _connectToLG();
                  ssh.relaunchLG();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Change button color to red
                  padding: EdgeInsets.symmetric(vertical: 40), // Adjust padding as needed
                ),
                child: Text(
                  'Relaunch',
                  style: TextStyle(fontSize: 30), // Adjust font size as needed
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () async {
                   await _connectToLG();
                  ssh.shutdownLG();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Change button color to yellow
                  padding: EdgeInsets.symmetric(vertical: 40), // Adjust padding as needed
                ),
                child: Text(
                  'Shutdown',
                  style: TextStyle(fontSize: 30), // Adjust font size as needed
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Perform 'Clean KML' task
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change button color to blue
                  padding: EdgeInsets.symmetric(vertical: 40), // Adjust padding as needed
                ),
                child: Text(
                  'Clean KML',
                  style: TextStyle(fontSize: 30), // Adjust font size as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
