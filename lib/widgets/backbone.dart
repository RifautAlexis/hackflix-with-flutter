import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hackflix/constants.dart';
import 'package:hackflix/theme/colors.dart';
import 'package:hackflix/widgets/custom_appbar.dart';
import 'package:hackflix/theme/theme.dart';

class BackboneWidget extends StatelessWidget {
  const BackboneWidget(
      {required this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.appBar});

  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final CustomAppbarWidget? appBar;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Get.changeColors(
          CustomColors.primaryDarkContrast01,
          CustomColors.primaryLightContrast01,
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(heightAppBar),
          child: appBar!,
        ),
        body: this.body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
