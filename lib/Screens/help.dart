import 'package:flutter/material.dart';

void main() => runApp(SafeSpaceHelpPage());

class SafeSpaceHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelpPage(),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Space Help Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          buildSectionTitle('Introduction'),
          buildSectionContent(
              'Safe Space is a comprehensive disaster management system designed to facilitate communication, resource allocation, and real-time updates during emergencies. The app aims to improve the coordination between the general public, emergency responders, and administrators to ensure a swift and effective response to disaster situations.'),
          buildSectionTitle('Getting Started'),
          buildSectionSubTitle('Installation'),
          buildSectionContent(
              '- Android Users: Visit the Google Play Store, search for "Safe Space," and click "Install."'
              '\n- iOS Users: Visit the Apple App Store, search for "Safe Space," and click "Download."'),
          buildSectionSubTitle('Account Creation'),
          buildSectionContent(
              '1. Open the Safe Space app.\n'
              '2. Click on "Sign Up."\n'
              '3. Fill in the required information (name, email, password).\n'
              '4. Click "Submit."\n'
              '5. Verify your email through the link sent to your inbox.'),
          buildSectionSubTitle('Logging In'),
          buildSectionContent(
              '1. Open the Safe Space app.\n'
              '2. Click on "Log In."\n'
              '3. Enter your registered email and password.\n'
              '4. Click "Submit."'),
          buildSectionTitle('Main Features'),
          buildSectionSubTitle('Reporting an Incident'),
          buildSectionContent(
              '1. Log in to your account.\n'
              '2. Click on "Report Incident."\n'
              '3. Fill in the incident details (type, location, description).\n'
              '4. Click "Submit."\n'
              '5. Your report will be sent to the administrators for validation.'),
          buildSectionSubTitle('Locating Resources'),
          buildSectionContent(
              '1. Log in to your account.\n'
              '2. Click on "Locate Resources."\n'
              '3. Search for the necessary resources (e.g., shelters, medical supplies).\n'
              '4. The app will display the nearest available resources.'),
          buildSectionSubTitle('Viewing Data Analytics'),
          buildSectionContent(
              '1. Log in to your account.\n'
              '2. Click on "Data Analytics."\n'
              '3. View the statistical data on past incidents, resource usage, etc.'),
          buildSectionSubTitle('Real-Time Notifications'),
          buildSectionContent(
              '1. Ensure you are logged in.\n'
              '2. Notifications will be sent automatically to your device in real-time.\n'
              '3. Click on the notification to view more details.'),
          buildSectionTitle('User Roles'),
          buildSectionSubTitle('General Users'),
          buildSectionContent(
              '- Report incidents.\n'
              '- Locate resources.\n'
              '- Receive real-time notifications.'),
          buildSectionSubTitle('Emergency Responders'),
          buildSectionContent(
              '- Receive alerts.\n'
              '- Coordinate response strategies.\n'
              '- Provide real-time instructions.'),
          buildSectionSubTitle('Administrators'),
          buildSectionContent(
              '- Validate reported incidents.\n'
              '- Manage data and system settings.\n'
              '- Train users and emergency responders.'),
          buildSectionTitle('Frequently Asked Questions (FAQs)'),
          buildSectionContent(
              '**Q: How do I reset my password?**\n'
              'A: Click on "Forgot Password" on the login page and follow the instructions.\n\n'
              '**Q: How do I update my profile information?**\n'
              'A: Log in and go to "Profile Settings" to update your information.\n\n'
              '**Q: Who do I contact for support?**\n'
              'A: Please see the Support section below.'),
          buildSectionTitle('Support'),
          buildSectionContent(
              'For further assistance, please contact our support team:\n'
              '- **Email:** support@safespace.com\n'
              '- **Phone:** +123-456-7890\n'
              '- **Live Chat:** Available on our website and within the app.'),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSectionSubTitle(String subTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        subTitle,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
