import 'package:cansat/connection_folder/settings.dart';
import 'package:cansat/home.dart';
import 'package:cansat/connection_folder/ssh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ssh = SSH(); 
    ssh.connectToLG();
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(ssh: ssh,),
        '/settings': (context) => const SettingsPage(),
      },
      title: 'CANSAT rocket and satellite visualization for Liquid Galaxy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
