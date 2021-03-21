import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/language_controller.dart';
import 'package:hackflix/data/language.dart';
import 'package:hackflix/theme/colors.dart';
import 'package:hackflix/widgets/svg_button.dart';
import 'package:hackflix/theme/theme.dart';

class DropdownLanguageWidget extends StatefulWidget {
  const DropdownLanguageWidget({
    Key? key,
  }) : super(key: key);
  @override
  _DropdownLanguageState createState() => _DropdownLanguageState();
}

class _DropdownLanguageState extends State<DropdownLanguageWidget>
    with SingleTickerProviderStateMixin {
  GlobalKey? _key;
  final LanguageController languageController = Get.find();
  bool isMenuOpen = false;
  late Offset buttonPosition;
  double buttonSize = 25.0;
  double margin = 5.0;
  late OverlayEntry _overlayEntry;
  BorderRadius _borderRadius = BorderRadius.circular(4);
  late AnimationController _animationController;
  final List<SvgPicture> flags = Language.languages
      .map<SvgPicture>(
        (e) => SvgPicture.asset(
          e.flagPath!,
          semanticsLabel: e.label,
        ),
      )
      .toList();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox = _key!.currentContext!.findRenderObject() as RenderBox;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
      ),
      child: SvgButtonWidget(
        svgPath: languageController.currentLanguage.value!.flagPath,
        label: languageController.currentLanguage.value!.label,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize,
          left: buttonPosition.dx,
          width: buttonSize + margin,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ClipPath(
                  clipper: ArrowClipper(),
                  child: Container(
                    width: 17,
                    height: 17,
                    color: Get.changeColors(
                      CustomColors.primaryDarkContrast01,
                      CustomColors.primaryLightContrast01,
                    ),
                  ),
                ),
              ),
              Container(
                height: flags.length * buttonSize + flags.length * margin,
                width: flags.length * buttonSize + margin,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Get.changeColors(
                    CustomColors.primaryDarkContrast01,
                    CustomColors.primaryLightContrast01,
                  ),
                  borderRadius: _borderRadius,
                ),
                child: Wrap(
                  runSpacing: margin,
                  children: List.generate(flags.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        languageController
                            .setLanguage(Language.languages[index]);
                        closeMenu();
                      },
                      child: Container(
                        width: buttonSize,
                        height: buttonSize,
                        child: flags[index],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
