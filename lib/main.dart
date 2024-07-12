import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safespace/Screens/Authentication/Login.dart';
import 'package:safespace/Screens/Authentication/provider.dart';
import 'package:safespace/Screens/pushnotification.dart';
import 'package:safespace/Screens/splashScreen.dart';
import 'package:safespace/Screens/navigatorScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:safespace/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// function to listen to background changes
@pragma('vm:entry-point')
Future _firebaseBackgroundMessage(RemoteMessage? message) async {
  print("Some notification Received in background...");
  print(message);
  if (message != null) {
    String payloadData = jsonEncode(message.data);
    print(payloadData);
    print(message.notification);
  }
}

Future<void> _foregroundHandler(RemoteMessage message) async {
  String payloadData = jsonEncode(message.data);
  // ignore: avoid_print
  print("Got a message in foreground");
  print(payloadData);
  print(message.notification);

  if (kIsWeb) {
    showNotification(
      title: message.notification!.title!,
      body: message.notification!.body!,
    );
  } else {
    PushNotifications.showSimpleNotification(
      title: message.notification!.title!,
      body: message.notification!.body!,
      payload: payloadData,
    );
  }
}

void _tapNotification(RemoteMessage message) {
  print("Background Notification Tapped");
  // navigatorKey.currentState!.pushNamed("/chat", arguments: message);
}

void _terminatedHandler(RemoteMessage message) {
  print("Terminated Notification Tapped");
  print(message.data);
  print(message.notification);

  // navigatorKey.currentState!.pushNamed("/chat", arguments: message);
}

// to handle notification on foreground on web platform
void showNotification({required String title, required String body}) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        )
      ],
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // initialize firebase messaging
  await PushNotifications.init();

  // initialize local notifications
  // don't use local notifications for web platform
  if (!kIsWeb) {
    await PushNotifications.localNotiInit();
  }

  // on background notification received
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  // on background notification tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
    if (message != null) {
      _tapNotification(message);
    }
  });

  // to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
    if (message != null) {
      _foregroundHandler(message);
    }
  });

  // for handling in terminated state
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      // Handle the notification that launched the app
      _terminatedHandler(message);
    }
  });
 SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  String? token = prefs.getString('token');
  String? id = prefs.getString('id');
  String? name = prefs.getString('name');
  String? email = prefs.getString('email'); // Retrieve email
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Safe Space',
      home: _isLoggedIn ? Navigatorscreen() : Splashscreen(),
      routes: {
        '/login': (context) => Login(),
        '/main': (context) => Navigatorscreen(),
      },
    );
  }
}
