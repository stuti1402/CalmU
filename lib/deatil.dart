//import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

Map audioData = {
  'url':
      'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4'
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
            CustomBody(),
            CustomBottomBar(),
            PlayButton(),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      width: MediaQuery.of(context).size.width,
      child: IgnorePointer(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 150.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(.01),
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: BottomBarClipper(),
              child: Container(
                height: 70.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 4.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.blueGrey.shade800,
                      Colors.blueGrey.shade800,
                      Colors.blue.shade800,
                      Colors.blue.shade300,
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: ClipPath(
                  clipper: BottomBarClipper(),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: double.infinity,
                    padding: EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blueGrey.shade100,
                          Colors.blueGrey.shade100,
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          currentTime,
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "rainforest - Relaxing",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          completeTime,
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayButton extends StatefulWidget {
  const PlayButton({Key key, this.mMusic}) : super(key: key);
  final Song mMusic;
  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  IconData btnIcon = Icons.play_arrow;
  AudioPlayer audioPlayer = new AudioPlayer();
  bool playing = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  String currentsong = "";
  final String path =
      "https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4";

  //seek bar
  Duration duration = new Duration();
  Duration position = new Duration();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 55.0,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey.shade900,
              Colors.blue.shade700,
            ],
          ),
        ),
        child: IconButton(
          icon: Icon(playing ? Icons.pause : Icons.play_arrow),
          color: Colors.white,
          onPressed: () {
            getAudio('url');

            if (playing) {
              audioPlayer.pause();

              setState(() {
                playing = false;
              });
            } else {
              audioPlayer.resume();
              setState(() {
                playing = true;
              });
            }
          },
        ),
        // icon: Icon(btnIcon ),
        //iconSize: 40,
      ),
    );
  }

  /*_audioPlayer.onDurationChanged.listen((event) {
    setState(() {
      duration=event;
    });
  });
  _audioPlayer.onDurationChanged.listen((event) {
    setState(() {
      position=event;
    });
  });*/
  void getAudio(String url) async {
    var url =
        "https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4";
    if (playing && currentsong != url) {
      audioPlayer.pause();
      int res = await audioPlayer.play(url);
      if (res == 1) {
        setState(() {
          currentsong = url;
        });
      }
    } else if (!playing) {
      int res = await audioPlayer.play(url);

      if (res == 1) {
        setState(() {
          playing = true;
          btnIcon = Icons.pause;
        });
      }
    }
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double listHeight = ((size.height * 0.06) * songs.length).toDouble();

    return Material(
      child: Column(
        children: [
          // contains image and background image with clipper
          CustomHeader(),

          // List of songs
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: listHeight,
              margin: EdgeInsets.only(bottom: size.height * 0.1),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: songs.length,
                  itemExtent: size.height * 0.055,
                  itemBuilder: (context, index) => ListTile(
                        leading: IconButton(
                          icon: Icon(
                            index == 0 ? Icons.play_arrow : Icons.play_arrow,
                            size: 22,
                          ),
                          onPressed: () {},
                        ),
                        title: index == 0
                            ? Text(
                                songs[index].name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                songs[index].name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        trailing: index == 0
                            ? Text(
                                songs[index].time,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            : Text(
                                songs[index].time,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                      )),
            ),
          ))
        ],
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
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white54,
                    ),
                    onPressed: () {},
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

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(4 * sw / 12, 0);

    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
