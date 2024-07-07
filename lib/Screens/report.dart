import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Authentication/provider.dart';
import 'package:safespace/Screens/navigatorScreen.dart';
// import 'package:safespace/providers/user_provider.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String Dropdowntext = "Flood";
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Choose an image source'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, ImageSource.camera),
              child: const Text('Camera'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
              child: const Text('Gallery'),
            ),
          ],
        );
      },
    );

    if (source != null) {
      final pickedFile = await _picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _selectedImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> sendReport() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final userName = userProvider.name ?? 'Unknown';
    final location = _locationController.text.trim();
    final visualDescription = _descriptionController.text.trim();
    final disasterType = Dropdowntext;
    final date = DateTime.now().toIso8601String();
    final status = 'active';

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.2:2000/user/createAlert'),
    );

    request.headers['Authorization'] = 'Bearer ${userProvider.token}';
    request.fields['userName'] = userName;
    request.fields['location'] = location;
    request.fields['visualDescription'] = visualDescription;
    request.fields['disasterType'] = disasterType;
    request.fields['date'] = date;
    request.fields['status'] = status;

  print(request.fields);

    if (_selectedImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'userImage',
        _selectedImage!.path,
      ));
    }

    var response = await request.send();
  print(response.statusCode );
    if (response.statusCode == 201) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigatorscreen()));
    } else {
      final responseBody = await response.stream.bytesToString();
      final error = jsonDecode(responseBody)['message'];
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to send report: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Hgreen,
        title: Text("Report an Incident", style: Poppins.copyWith(fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.report_outlined, size: 100, color: Colors.red),
                  SizedBox(height: 10),
                  Text("Please provide the following information!", style: PoppinsBold.copyWith(fontSize: 15)),
                  SizedBox(height: 30),
                  Text("Type of Disaster", style: PoppinsBold.copyWith(fontSize: 15)),
                  DropdownButton(
                    value: Dropdowntext,
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(child: Text("Flood", style: Poppins), value: "Flood"),
                      DropdownMenuItem(child: Text("Accident", style: Poppins), value: "Accident"),
                      DropdownMenuItem(child: Text("Fire", style: Poppins), value: "Fire"),
                      DropdownMenuItem(child: Text("Emergency", style: Poppins), value: "Emergency"),
                      DropdownMenuItem(child: Text("Missing", style: Poppins), value: "Missing"),
                    ],
                    icon: Icon(Icons.expand_more_outlined),
                    onChanged: (value) => setState(() {
                      Dropdowntext = value.toString();
                    }),
                  ),
                  SizedBox(height: 30),
                  Align(alignment: Alignment.topLeft, child: Text("Location", style: PoppinsBold.copyWith(fontSize: 15))),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(alignment: Alignment.topLeft, child: Text("Description", style: PoppinsBold.copyWith(fontSize: 15))),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15,
                    child: TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(alignment: Alignment.topLeft, child: Text("Image", style: PoppinsBold)),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Center(child: _selectedImage == null ? Icon(Icons.attach_file_outlined) : Image.file(_selectedImage!)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: sendReport,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Hgreen,
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Send Report", style: PoppinsBold.copyWith(fontSize: 20, color: Colors.white)),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_outlined, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
