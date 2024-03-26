import 'dart:async';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SSH {
  late String _host;
  late String _port;
  late String _username;
  late String _passwordOrKey;
  late String _numberOfRigs;
  SSHClient? _client;


  Future<void> initConnectionDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _host = prefs.getString('ipAddress') ?? 'default_host';
    _port = prefs.getString('sshPort') ?? '22';
    _username = prefs.getString('username') ?? 'lg';
    _passwordOrKey = prefs.getString('password') ?? 'lg';
    _numberOfRigs = prefs.getString('numberOfRigs') ?? '3';
  }

  Future<bool?> connectToLG() async {
    await initConnectionDetails();

    try {
    final socket = await SSHSocket.connect(_host, int.parse(_port));

   _client = SSHClient(
    socket,
    username: _username,
    onPasswordRequest: () => _passwordOrKey,
  );
  print('IP: $_host, port: $_port');

      return true;
    } on SocketException catch (e) {
      print('Failed to connect: $e');
      return false;
    }
  }

  Future<SSHSession?> Lleida() async {
    try {
      if (_client == null) {
        print('SSH client is not initialized.');
        return null;
      }

      final execResult = await _client!.execute('echo "search= Aeroport de Lleida Alguaire" >/tmp/query.txt');
      print('executed');

      return execResult;
    } catch (e) {
      print('An error occurred while executing the command: $e');
      return null;
    }
  }

// Igualada-Ódena Airport

  Future<SSHSession?> Odena() async {
    try {
      if (_client == null) {
        print('SSH client is not initialized.');
        return null;
      }

      final execResult = await _client!.execute('echo "search= Igualada-Ódena Airport" >/tmp/query.txt');
      print('executed');

      return execResult;
    } catch (e) {
      print('An error occurred while executing the command: $e');
      return null;
    }
  }



  Future<SSHSession?> Zaragoza() async {
    try {
      if (_client == null) {
        print('SSH client is not initialized.');
        return null;
      }

      final execResult = await _client!.execute('echo "search= San Gregorio Zaragoza" >/tmp/query.txt');
      print('executed');

      return execResult;
    } catch (e) {
      print('An error occurred while executing the command: $e');
      return null;
    }
  }

    Future<SSHSession?>  Spain() async {
    try {
      if (_client == null) {
        print('SSH client is not initialized.');
        return null;
      }

      final execResult = await _client!.execute('echo "search= Spain" >/tmp/query.txt');
      print('executed');

      return execResult;
    } catch (e) {
      print('An error occurred while executing the command: $e');
      return null;
    }
  }
  
Future<void> relaunchLG() async {
  try {
    if (_client == null) {
      print('SSH client is not initialized.');
      return;
    }
    for (int i = 1; i <= 3; i++) {
      final execResult = await _client!.execute("""
        relaunch="\\
        if [-f /etc/init/lxdm.conf ]; then 
        export SERVICE=lxdm
        elif [ -f /etc/init/lightdm.conf ]; then 
        export SERVICE=lightdm
        else 
        exit 1
        fi
        if [[ \\\$(service\\\$SERVICE status) =~ 'stop' ]]; then 
        echo $_passwordOrKey | sudo -S service \\\${SERVICE} start 
        else 
        echo $_passwordOrKey | sudo -S service \\\${SERVICE} restart
        fi
        ";
        sshpass -p $_passwordOrKey ssh -x -t lg@lg$i "\$relaunch\"
      """);

      // Check if the command executed successfully
      if (execResult.exitCode != null && execResult.exitCode == 0) {
        print('Relaunch command sent to LG$i');
      } else {
        if (execResult.exitCode == null) {
          print('Failed to send relaunch command to LG$i. Exit code: null');
        } else {
          print('Failed to send relaunch command to LG$i. Exit code: ${execResult.exitCode}');
        }
      }
    }
  } catch (e) {
    print('An error occurred while relaunching the Liquid Galaxy system: $e');
  }
}

Future<void> createOrbit(String cityName) async {
  try {
    if (_client == null) {
      print('SSH client is not initialized.');
      return;
    }

    // Set the search query to the desired city
    await _client!.execute('echo "search=$cityName" >/tmp/query.txt');

    // Wait for a short duration to ensure the search command is processed
    await Future.delayed(Duration(seconds: 2));

    // Execute the orbit command
    await _client!.execute('echo "start_orbit" >/tmp/query.txt');

    print('Orbit created around $cityName');
  } catch (e) {
    print('An error occurred while executing the command: $e');
  }
}

  Future<void> shutdownLG() async {
    try {
      for (var i = 1; i <= int.parse(_numberOfRigs); i++) {
        await _client!.execute('sshpass -p $_passwordOrKey ssh -t lg$i "echo $_passwordOrKey | sudo -S poweroff"');
      }
    } catch (error) {
      print('An error occurred while shutting down the LG machines: $error');
    }
  }


Future<void> rebootLG() async {
  try {
    print('Warning: Rebooting LG machines.');
    for (var i = 1; i <= int.parse(_numberOfRigs); i++) {
      await _client!.execute('sshpass -p $_passwordOrKey ssh -t lg$i "echo $_passwordOrKey | sudo -S reboot"');
    }
  } catch (error) {
     print('an error');
      return null;
  }
}

  Future<void> dispatchKml(String kmlContent) async {
    try {
      if (_client == null) {
        print('SSH client is not initialized.');
        return;
      }

      // Send the KML content to the Liquid Galaxy machine
      final execResult = await _client!.execute('''
        echo '$kmlContent' > /tmp/kml.kml
        /bin/bash /home/lg/bin/textt.sh --kml /tmp/kml.kml
      ''');

      print('KML query dispatched successfully.');
    } catch (e) {
      print('An error occurred while dispatching the KML query: $e');
    }
  }

  

  SSHClient? get client => _client;
}
