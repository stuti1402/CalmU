import 'package:flutter_meditation/focus/models/style.dart';

import 'course.dart';

final _standStyle = Style(
  imageUrl: 'assets/pose2.png',
  name: 'Standing Style',
  time: 5,
);
final _sittingStyle = Style(
  imageUrl: 'assets/pose1.png',
  name: 'Sitting Style',
  time: 8,
);
final _legCrossStyle = Style(
  imageUrl: 'assets/pose3.png',
  name: 'Leg Cross Style',
  time: 6,
);

final styles = [_standStyle, _sittingStyle, _legCrossStyle];

final _course1 = Course(
    imageUrl: 'assets/course1.jpg',
    name: 'Advance Stretchings',
    time: 45,
    students: 'Advanced');

final _course2 = Course(
    imageUrl: 'assets/course2.jpg',
    name: 'Daily Yoga',
    time: 30,
    students: 'Intermediate');

final _course3 = Course(
    imageUrl: 'assets/course3.jpg',
    name: 'Meditation',
    time: 20,
    students: 'Beginner');

final List<Course> courses = [_course1, _course3, _course2];
