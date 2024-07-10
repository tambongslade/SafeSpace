import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

// Model for Responder
class Responder {
  final String name;
  final String location;
  final String contact;
  final String category;

  Responder({required this.name, required this.location, required this.contact, required this.category});

  factory Responder.fromJson(Map<String, dynamic> json) {
    return Responder(
      name: json['name'],
      location: json['location'],
      contact: json['contact'],
      category: json['category'],
    );
  }
}

// Main Emergency Page
class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  late Future<List<Responder>> futureResponders;

  @override
  void initState() {
    super.initState();
    futureResponders = fetchResponders();
  }

  Future<List<Responder>> fetchResponders() async {
    final response = await http.get(Uri.parse('http://192.168.1.177:3000/user/responders'));
  print(response);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((responder) => Responder.fromJson(responder)).toList();
    } else {
      throw Exception('Failed to load responders');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Responders")),
      body: FutureBuilder<List<Responder>>(
        future: futureResponders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              children: snapshot.data!.map((responder) {
                return ListTile(
                  title: Text(responder.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResponderDetail(responder: responder),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}

// Responder Detail Page
class ResponderDetail extends StatelessWidget {
  final Responder responder;

  const ResponderDetail({Key? key, required this.responder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(responder.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${responder.name}', style: TextStyle(fontSize: 20)),
            Text('Location: ${responder.location}', style: TextStyle(fontSize: 20)),
            Text('Category: ${responder.category}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Contact: ${responder.contact}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
               onPressed: () async {
            final String contact = responder.contact;
            if (contact != null && contact.isNotEmpty) {
              final Uri uri = Uri(
                scheme: 'tel',
                path: contact,
              );

              try {
                if (await canLaunch(uri.toString())) {
                  await launch(uri.toString());
                } else {
                  throw 'Could not launch ${uri.toString()}';
                }
              } catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to make a call: $e'),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Invalid phone number'),
                ),
              );
            }
          },
              child: Text('Call ${responder.contact}'),
            ),
          ],
        ),
      ),
    );
  }
}
