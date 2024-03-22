import 'package:flutter/material.dart';

class CANSATparts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CANSAT Parts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              _buildPartInfo(
                'CanSat Structure',
                'The CanSat structure is usually designed to fit within the dimensions of a standard soda can. It provides a compact and lightweight enclosure for housing the electronic components and payload. The structure should be sturdy enough to withstand the forces experienced during launch, flight, and landing, while also being lightweight to ensure the CanSat meets payload weight limitations.',
                 AssetImage('assets/cansat_image9.jpg'),
                 AssetImage('assets/cansat_image6.jpg'),
              ),
              _buildPartInfo(
                'Battery',
                'The battery supplies power for operation of all systems of the CanSat. Lithium polymer batteries (LiPo) are commonly used due to their high energy density and lightweight properties. The battery\'s capacity and voltage should be chosen carefully to meet the power requirements of the CanSat\'s components and ensure sufficient operational duration.',
                // AssetImage('assets/cansat_image9.jpg'),
              ),
              _buildPartInfo(
                'Microprocessor',
                'The microprocessor serves as the brain of the CanSat, responsible for receiving signals from external sensors and executing programmed tasks. Microcontrollers (MCUs) are commonly used as microprocessors in CanSats, providing processing power and onboard memory for data storage. Common MCU choices include STM32, NXP LPC, ESP32, and AVR.',
              AssetImage('assets/cansat_image7.png'),
              AssetImage('assets/cansat_image8.png'),
              ),
              _buildPartInfo(
                'Sensors',
                'CanSats integrate various sensors to collect data during the mission. Barometer measures atmospheric pressure to calculate altitude. Thermometer measures temperature. GPS Module receives signals from satellites to determine the CanSat\'s position. Accelerometer measures acceleration to detect changes in velocity. Electronic Compass determines the CanSat\'s orientation relative to the Earth\'s magnetic field. Cameras capture images or videos during the CanSat\'s descent for visual observation or analysis.',
              ),
              _buildPartInfo(
                'Additional Components',
                'Parachute: Equipped with a recovery mechanism, typically a parachute, CanSats endure descent with minimal damage, ensuring reusability. Transmitter sends telemetry data to ground stations for real-time monitoring and tracking. Antenna receives commands from ground stations and transmits telemetry data. Payload: CanSats can carry various payloads depending on the mission objectives, such as scientific instruments, communication devices, or experimental systems.',
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildPartInfo(String title, String description, [ImageProvider? leftImage, ImageProvider? rightImage]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.0),
      Text(
        description,
        style: TextStyle(fontSize: 16.0),
      ),
      SizedBox(height: 16.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (leftImage != null)
            Image(
              image: leftImage,
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
          if (rightImage != null)
            Image(
              image: rightImage,
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
        ],
      ),
      SizedBox(height: 16.0),
    ],
  );
}
}