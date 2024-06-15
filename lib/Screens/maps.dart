import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:safespace/Constants/styles.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Maps",style: PoppinsBold,),

      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          
          child: FlutterMap(
            mapController: MapController(),
             options: MapOptions(
          initialCenter: LatLng(3.848032, 11.523458),
          initialZoom: 15.0,
        ),
        children: [
        
          TileLayer(
            urlTemplate: 
            "https://api.mapbox.com/styles/v1/sladeghost1998/clx8ydokc00j401qsc57pdxmd/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2xhZGVnaG9zdDE5OTgiLCJhIjoiY2x4OHk5Y2k4MnB0YjJpczlnbWhncGl1aSJ9.QTDlCGME4GzL9MHhKEiVaw",
          ),
            MarkerLayer(
  markers: [
    Marker(
      point: LatLng(3.848032, 11.523458),
      width: 80,
      height: 80,
      child: Image(image: AssetImage("assets/images/police.png")),
    ),
  ],
),
        ],
            
          ),
        )
      ],),
    );
  }
}