//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_meditation/MusicPage.dart';
import 'package:flutter_meditation/sidebar.dart';

Map audioData = {
  'url1':
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4',
  'url2':
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4',
};

class Song {
  final String name;
  final String time;

  Song({this.name, this.time});
}

List<Song> songs = [
  Song(name: "Behaviour of the mind", time: "3:25"),
  Song(name: "Your inner voice", time: "2:41"),
  Song(name: "Embrace your emotions", time: "3:16"),
  Song(name: "Letting go everythong", time: "3:28"),
  Song(name: "Feel the sky", time: "2:56"),
  Song(name: "Go beyond the form", time: "3:24"),
  Song(name: "Love the feelings", time: "3:44"),
];

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CustomHeader(),
            SideBar(),
            MusicPage(),
          ],
        ),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        HeaderBackground(),
        Container(
          alignment: Alignment.center,
          height: 500.0,
          padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Killing Anxiety",
                  style: TextStyle(fontSize: 35.0),
                  children: [
                    TextSpan(
                      text:
                          "\n \nCalm your anxieties, reduce tension and increase body awareness",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "by Isabell Winter",
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 5.0,
                ),
                width: 150.0,
                height: 2.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey.withOpacity(.05),
                      Colors.grey.withOpacity(.5),
                      Colors.grey.withOpacity(.05),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 150.0,
          height: 150.0,
          margin: EdgeInsets.only(
            top: 275.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/anxiety.jpg"),
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ],
    );
  }
}

class HeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 150.0,
          height: 150.0,
          margin: EdgeInsets.only(
            top: 275.0,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 100.0,
                spreadRadius: 20.0,
                color: Colors.blueGrey.shade800,
              ),
            ],
          ),
        ),
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            margin: EdgeInsets.only(
              top: 5.0,
            ),
            height: 450.0,
            color: Colors.white,
          ),
        ),
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 450.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/city.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * .7, 0, sh * .8, 0, sh * .55);
    path.lineTo(0, sh);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
