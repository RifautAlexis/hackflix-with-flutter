import 'package:flutter/material.dart';
import 'package:hackflix/widgets/custom_appbar.dart';

class Backbone extends StatelessWidget {
  const Backbone({@required this.body, this.floatingActionButton, this.floatingActionButtonLocation, this.appbarSubWidget});

  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget appbarSubWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(appbarSubWidget: appbarSubWidget),
      ),
      body: SafeArea(
        child: this.body,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
