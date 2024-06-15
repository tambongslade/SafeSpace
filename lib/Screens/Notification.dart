import 'package:flutter/material.dart';
import 'package:safespace/Constants/styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(children: [
        const NotificationCard(AlertColor: Colors.red),
        NotificationCard(AlertColor: Color.fromARGB(255, 132, 130, 76)),
        NotificationCard(AlertColor: Colors.green),
      ]),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final Color AlertColor;
  const NotificationCard({required this.AlertColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Card(
        color: Colors.grey.shade300,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.warning, color: Colors.red),
                  const SizedBox(width: 10),
                  Text("Alert Type",
                      style: PoppinsBold.copyWith(
                          fontSize: 18, color: AlertColor)),
                ],
              ),
              const Divider(height: 20),
              Text(
                "Flood",
                style: PoppinsBold.copyWith(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(height: 10),
              Text(
                "Lorem ipsum is simply dummy text of asdad asdasd  ",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Poppins.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_right, color: Colors.teal),
                  label:
                      const Text("Go to", style: TextStyle(color: Colors.teal)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
