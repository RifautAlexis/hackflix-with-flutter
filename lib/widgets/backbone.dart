import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hackflix/controllers/backbone_controller.dart';
import 'package:hackflix/widgets/custom_appbar.dart';

class Backbone extends GetView<BackboneController> {
  const Backbone({this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(),
      ),
      body: SafeArea(
        child: this.body,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Float action button pressed"),
        child: Icon(Icons.notifications),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
