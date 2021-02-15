import 'package:flutter/material.dart';

class Backbone extends StatelessWidget {
  const Backbone({this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hackflix with Flutter"),
      ),
      body: this.body,
    );
  }
}