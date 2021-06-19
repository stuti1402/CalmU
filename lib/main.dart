import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meditation/open.dart';
import 'package:flutter_meditation/sleep/provider/meditation_provider.dart';
import 'package:provider/provider.dart';

import 'animation_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black87, // navigation bar color
      statusBarColor: Color(0xff997f66), // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icon color
      systemNavigationBarIconBrightness:
          Brightness.dark, // color of navigation controls
    ),
  );
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    print(notification.audioId);
    return true;
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return ChangeNotifierProvider<MeditationProvider>(
      create: (context) => MeditationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Open(),
          ),
          IgnorePointer(
              child: AnimationScreen(color: Theme.of(context).accentColor))
        ],
      ),
    );
  }
}
