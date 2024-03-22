import 'package:flutter/material.dart';

class LaunchMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launch Map'),
      ),
      body: Center(
        child: Text('Display an interactive map showing CANSAT launch locations'),
      ),
    );
  }
}
