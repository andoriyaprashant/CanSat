import 'package:flutter/material.dart';

class CANSATinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All About Cansat'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Introduction:'),
            _buildParagraph(
              'A CanSat, short for "Can Satellite," serves as a miniature yet impactful tool in the realm of space exploration. While resembling the design of a typical soda can, these ingenious payloads embody the essence of space technology education. Although they\'ve never breached Earth\'s atmosphere or achieved orbit, their significance lies in their capacity to educate and inspire.',
            ),
            SizedBox(height: 16.0),
            _buildImagesRow([
              'assets/cansat_image1.webp',
              'assets/cansat_image2.jpg',
            ]),
            SizedBox(height: 32.0),
            _buildSectionTitle('Key Attributes:'),
            _buildBulletPoint(
              'Payload Specifications: CanSats are engineered to fit snugly within the confines of a standard soda can, measuring 66mm in diameter and 115mm in height, with a weight limitation of 350g.',
            ),
            _buildBulletPoint(
              'Deployment: During competitions, these payloads are launched from small rockets, reaching varying altitudes based on competition standards.',
            ),
            _buildBulletPoint(
              'Recovery System: Equipped with a recovery mechanism, typically a parachute, CanSats endure descent with minimal damage, ensuring reusability.',
            ),
            _buildBulletPoint(
              'Educational Tool: CanSats serve as invaluable educational resources owing to their affordability and compact design, making space technology accessible to aspiring engineers and scientists.',
            ),
            SizedBox(height: 32.0),
            _buildSectionTitle('Historical Evolution:'),
            _buildParagraph(
              'The genesis of CanSats traces back to 1998 when visionaries congregated at the "University Space Systems Symposium" in Hawaii. Spearheaded by Bob Twiggs, the concept germinated into the ARLISS project, culminating in the inaugural launch in 1999. Over the years, these endeavors evolved, diversifying missions and fostering innovation in space technology education.',
            ),
            SizedBox(height: 32.0),
            _buildSectionTitle('Operation Essentials:'),
            _buildBulletPoint(
              'Battery: Powering the CanSat\'s operations, lithium polymer batteries are favored for their efficiency and weight-to-performance ratio.',
            ),
            _buildBulletPoint(
              'Microprocessor: Serving as the nucleus, the microprocessor orchestrates signal reception from external sensors and executes programmed tasks.',
            ),
            _buildBulletPoint(
              'Primary Sensors: CanSats integrate an array of sensors including barometers, thermometers, and GPS modules, facilitating data collection and navigation.',
            ),
            _buildBulletPoint(
              'Additional Components: Accelerometers, electronic compasses, and cameras augment CanSat functionalities, enhancing maneuverability and data acquisition.',
            ),
            SizedBox(height: 32.0),
            _buildSectionTitle('Types of CanSats:'),
            _buildBulletPoint(
              'Telemetry: Primarily focused on real-time data collection, telemetry-based CanSats relay flight and weather information without steering mechanisms.',
            ),
            _buildBulletPoint(
              'Comeback: Engineered for controlled descent, these CanSats navigate towards predetermined targets using GPS or Inertial Navigation Systems (INS), incorporating steering mechanisms for precision landing.',
            ),
            _buildBulletPoint(
              'Openclass: Offering a platform for innovation, Openclass CanSats accommodate experimental systems and novel designs, fostering exploration beyond conventional boundaries.',
            ),
            SizedBox(height: 32.0),
            _buildSectionTitle('Educational Significance:'),
            _buildBulletPoint(
              'Practical Learning: CanSats afford students a hands-on experience in space projects, empowering them to navigate every aspect from mission selection to data analysis.',
            ),
            _buildBulletPoint(
              'Problem-Based Learning: Embracing a problem-based learning approach, students tackle open-ended challenges, fostering creativity and resilience.',
            ),
            _buildBulletPoint(
              'Systems Engineering: By engaging in CanSat projects, students delve into systems engineering, navigating complexities while honing critical thinking and teamwork skills.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_right,
            size: 16.0,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesRow(List<String> imagePaths) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imagePaths.map((path) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200.0,
              height: 200.0,
              child: Image.asset(
                path,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
