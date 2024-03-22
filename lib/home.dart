import 'package:cansat/Screens/about_app.dart';
import 'package:cansat/Screens/about_cansat.dart';
import 'package:cansat/Screens/cansat_parts.dart';
import 'package:cansat/Screens/cansat_tasks.dart';
import 'package:cansat/connection_folder/connection.dart';
import 'package:cansat/connection_folder/ssh.dart';
import 'package:flutter/material.dart';

bool connectionStatus = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required SSH ssh}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SSH ssh;

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
        title: const Text('CANSAT rocket and satellite visualization for Liquid Galaxy'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await Navigator.pushNamed(context, '/settings');
              _connectToLG();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Perform search operation based on the value
                    },
                  ),
                ),
                SizedBox(width: 10),
                ConnectionFlag(status: connectionStatus),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
              _buildProjectContainer(
              image: const AssetImage('assets/Project_1_LIeida.png'), 
              title: 'Lleida 29/04/2023',
              details: 'Catalan CanSat competition held in Aeroport de Lleida Alguaire, were 18 CanSats were launched',
              visualizeCallback: () async {
                 await ssh.Lleida();
              },
             ),
              _buildProjectContainer(
              image: const AssetImage('assets/Project_2_Òdena.png'), 
              title: 'Òdena 07/05/2022',
              details: 'First Catalan CanSat competition held in Òdena – Catalonia. In total, we successfully launched 18 CanSats.',
              visualizeCallback: () {

              },
            ),
                 _buildProjectContainer(
                  image: const AssetImage('assets/Project_3_Granada.png'), 
                  title: 'Granada 16/07/2020 ',
                  details: 'First national CanSat competition held in Granada. We successfully launched 12 CanSats',
                  visualizeCallback: () {

                  },
                ),
                 _buildProjectContainer(
                  image: const AssetImage('assets/Navarra.png'), 
                  title: 'Navarra 07/03/2020 ',
                  details: 'In March 2020, we launched 12 cansats for the basque regional competition.',
                  visualizeCallback: () {

                  },
                ),
                 _buildProjectContainer(
                  image: const AssetImage('assets/cansat_image10.png'), 
                  title: 'Zaragoza 05/05/2018 ',
                  details: 'National Spanish CanSat competition held in San Gregorio, Zaragoza. 12 CanSats were launched and it was a complete success.',
                  visualizeCallback: () async {
                      await ssh.Zaragoza();
                  },
                ),
                 _buildProjectContainer(
                  image: const AssetImage('assets/cansat_image11.png'), 
                  title: 'Berrozi 21/04/2018',
                  details: 'First basque CanSat competition held in Berrozi, Álava',
                  visualizeCallback: () {

                  },
                ),
                 _buildProjectContainer(
                  image: const AssetImage('assets/cansat_image12.png'), 
                  title: 'Alcolea de Cinca 23/09/2017',
                  details: 'Our first CanSat mission was a success and paved our way into the national competition',
                  visualizeCallback: () { 

                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CANSATinfo()),
                    );
                  },
                  child: Text('Info'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CANSATparts()),
                    );
                  },
                  child: Text('Parts'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CansatTaskScreen()), 
                    );
                  },
                  child: Text('Tasks'), // Add a button for tasks
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutScreen()),
                    );
                  },
                  child: Text('About'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => CANSATparts()),
                //     );
                //   },
                //   child: Text('Help'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildProjectContainer({
  required AssetImage image,
  required String title,
  required String details,
  required VoidCallback visualizeCallback,
}) {
  return Container(
    padding: EdgeInsets.all(16.0),
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 275.0, // Increase the width of the image container
          height: 200.0, // Increase the height of the image container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                details,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: visualizeCallback,
                child: Text('Visualize in LG'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
