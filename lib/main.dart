import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meditation/deatil.dart';
import 'package:flutter_meditation/focus.dart';
import 'package:flutter_meditation/sidebar.dart';
import 'package:flutter_meditation/sleep.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black87, // navigation bar color
      statusBarColor: Color(0xffaba197), // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icon color
      systemNavigationBarIconBrightness:
          Brightness.dark, // color of navigation controls
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
    return Scaffold(
      body: Stack(
        children: [
          CustomBody(),
          CustomAppbar(),
          NavBar(),
          SideBar(),
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 105.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black87,
              Colors.transparent,
            ],
          ),
        ),
        child: Stack(
          children: [
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                color: Color(0xffaba197),
              ),
            ),
            Positioned(
              top: 35.0,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.grey.shade100,
                  ),
                  CircleAvatar(
                    radius: 23.0,
                    backgroundImage: AssetImage("assets/face.jpg"),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 75.0,
              left: MediaQuery.of(context).size.width / 2 - 10,
              child: CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.white,
                child: FittedBox(
                  child: Icon(
                    Icons.add,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Section(
              headline: "Meditation",
              description: "discover happiness",
              img: AssetImage("assets/dessert.jpg"),
            ),
            Section(
              headline: 'Sensations',
              description: 'feel the moment',
              img: AssetImage('assets/galaxy.jpg'),
            ),
          ],
        ),
        Center(
          child: ClipPath(
            clipper: MidClipper(),
            child: Section(
              headline: 'Daydream',
              description: 'go beyond the form',
              img: AssetImage('assets/beach.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String headline;
  final String description;
  final ImageProvider img;

  const Section({
    Key key,
    this.headline,
    this.description,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: img,
          ),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: headline,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '\n$description',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff1e1e1e),
            ),
          ),
        ),
        Positioned(
          bottom: 45.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavOne(
                icon: Icons.bubble_chart,
                active: false,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavTwo(
                icon: Icons.landscape,
                active: true,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavThree(
                icon: Icons.brightness_3,
                active: false,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Focus",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 1.0,
              ),
              Text(
                "Relax",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 1.0,
              ),
              Text(
                "Sleep",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavOne extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavOne({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Focuses(),
          ),
        );
      },
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Color(0xff1e1e1e),
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(
            icon,
            color: active ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}

class NavTwo extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavTwo({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Color(0xff1e1e1e),
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(
            icon,
            color: active ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}

class NavThree extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavThree({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sleep(),
          ),
        );
      },
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Color(0xff1e1e1e),
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(
            icon,
            color: active ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}

class MidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(0, sh * .3, sw, sh * .2, sw, sh * .45);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * .7, 0, sh * .8, 0, sh * .55);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(0, sh);
    path.lineTo(4 * sw / 12, sh);
    path.cubicTo(5 * sw / 12, sh, 5 * sw / 12, sh / 2, 6 * sw / 12, sh / 2);
    path.cubicTo(7 * sw / 12, sh / 2, 7 * sw / 12, sh, 8 * sw / 12, sh);
    path.lineTo(sw, sh);
    path.lineTo(sw, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
