import 'package:flutter/material.dart';

class ProDeepTemplate extends StatelessWidget {
  final screen;
  final screns = {};

  ProDeepTemplate({super.key, required this.screen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home of new world',
      home: screen,
    );
  }
}
