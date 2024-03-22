// cansat_explorer.dart

import 'package:flutter/material.dart';

class CANSATExplorer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CANSAT Explorer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/teams');
          },
          child: Text('Explore CANSATs'),
        ),
      ),
    );
  }
}
