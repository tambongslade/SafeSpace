import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return CommentsBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        NewsDetailPage(),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconTextButton(
                    icon: Icons.favorite_border,
                    text: '145',
                    onPressed: () {}, // Implement liking functionality
                  ),
                  IconTextButton(
                    icon: Icons.comment,
                    text: '24',
                    onPressed: () {
                      _showCommentsBottomSheet(context);
                    }, // Implement comment functionality
                  ),
                  IconTextButton(
                    icon: Icons.share,
                    text: 'Share',
                    onPressed: () {}, // Implement share functionality
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class CommentsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (_, controller) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Comments(24)",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: 10, // Number of comments
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text("User $index"),
                          subtitle: Text("This is a comment from user $index"),
                          leading: Icon(Icons.person),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Divider(),
              GestureDetector(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Add a comment...",
                    border: OutlineInputBorder(),
                    suffixIcon: Container(
                      width: 10,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Hgreen
                     ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_upward_outlined, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Buea Flooding: WASH response (16 May 2023)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'posted on: 25/11/2022',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  child: Image(image: AssetImage("assets/images/flood.jpeg"))),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.7,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                AutoSizeText(
                  'CONTEXT\n\n'
                  'March 18, 2023, torrential rains hit Buea town in Southwest Region, leading to floods and mudslides from Mount Cameroon to some communities at the foot of the mountain causing several casualties among residents of Buea. Humanitarian partners including UN agencies, national and international NGOs organized a joint mission on Sunday March 19, to visit the affected areas in order to have an overview of the urgent needs: WASH, Shelter/NFI, Health, Education and Protection were identified as immediate needs.\n\n'
                  'Water Trucking\n\n'
                  'The floods damaged the water catchment and water supply system, leaving populations in affected sites and neighboring neighborhoods in great precariousness. UNICEF installed tanks for People accessing safe water for drinking, cooking and personal hygiene.\n'
                  '5 Water tanks of 5000 liters each installed in 5 communities of Buea Town (Strangers, Wondongo, Werume, Longstreet, Violet West area sector) and more.',
                  style: Poppins.copyWith(wordSpacing: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  IconTextButton(
      {required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, color: Colors.grey),
      label: Text(text),
      onPressed: onPressed,
    );
  }
}
