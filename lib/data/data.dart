import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transectionData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger, color: Colors.white,),
    'name': 'Food',
    'color': Colors.blue,
    'totalAmount': '-\$ 45.00',
    'date': 'Today'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.shop, color: Colors.white,),
    'name': 'Shopping',
    'color': Colors.red,
    'totalAmount': '-\$ 150.00',
    'date': 'Today'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.houseMedicalCircleCheck, color: Colors.white,),
    'name': 'Heath',
    'color': Colors.green,
    'totalAmount': '-\$ 200.00',
    'date': 'Yesterday'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.plane, color: Colors.white,),
    'name': 'Travel',
    'color': Colors.purple,
    'totalAmount': '-\$ 620.00',
    'date': 'Yesterday'
  },
];
