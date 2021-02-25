import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;

  Option({this.icon, this.title});
}

final options = [
  Option(
    icon: Icon(Icons.ad_units, size: 40.0),
    title: 'Notifications',
  ),
  Option(
    icon: Icon(Icons.access_time_outlined, size: 40.0),
    title: 'Date and Time Settings',
  ),
  Option(
    icon: Icon(Icons.lock_clock, size: 40.0),
    title: 'Athan and reminders',
  ),
  Option(
    icon: Icon(Icons.location_on_rounded, size: 40.0),
    title: 'Location Settings',
  ),

];