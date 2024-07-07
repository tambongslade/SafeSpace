import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TipsPage(),
    );
  }
}

class TipsPage extends StatelessWidget {
  final List<Map<String, String>> tips = [
    {
      'title': 'Earthquake',
      'description': 'Drop, Cover, and Hold On during an earthquake.'
    },
    {
      'title': 'Flood',
      'description': 'Move to higher ground immediately during a flood.'
    },
    {
      'title': 'Hurricane',
      'description': 'Stay indoors and away from windows during a hurricane.'
    },
    // Add more tips here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Natural Disaster Tips'),
      ),
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tips[index]['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      tips[index]['description']!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
