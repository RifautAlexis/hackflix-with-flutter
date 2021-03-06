import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hackflix/controllers/language_controller.dart';
import 'package:hackflix/data/language.dart';

// class DropdownLanguage extends GetView<LanguageController> {
//   const DropdownLanguage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         width: 50,
//         child: DropdownButton<Language>(
//           // isExpanded: true,
//           // value: controller.currentLanguage.value,
//           icon: Icon(icon)
//           items: Language.languages
//               .map<DropdownMenuItem<Language>>((Language language) {
//             return DropdownMenuItem<Language>(
//               value: language,
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ConstrainedBox(
//                       constraints: BoxConstraints(
//                         maxHeight: 25,
//                         maxWidth: 25,
//                       ),
//                       child: SvgPicture.asset(
//                         language.flagPath,
//                         semanticsLabel: language.label,
//                       ),
//                     ),
//                     Text(language.label),
//                   ]),
//             );
//           }).toList(),
//           onChanged: (Language value) => controller.setLanguage(value),
//         ),
//       ),
//     );
//   }
// }

class DropdownLanguage extends StatefulWidget {
  const DropdownLanguage({
    Key key,
  })  : super(key: key);
  @override
  _DropdownLanguageState createState() => _DropdownLanguageState();
}

class _DropdownLanguageState extends State<DropdownLanguage>
    with SingleTickerProviderStateMixin {
  GlobalKey _key;
  final LanguageController languageController = Get.find();
  bool isMenuOpen = false;
  Offset buttonPosition;
  Size buttonSize;
  OverlayEntry _overlayEntry;
  BorderRadius _borderRadius = BorderRadius.circular(4);
  AnimationController _animationController;
  final Color backgroundColor = Color(0xFFF67C0B9);
  final Color iconColor = Colors.black;
  final List<SvgPicture> flags = Language.languages
        .map<SvgPicture>(
          (e) => SvgPicture.asset(
            e.flagPath,
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
    RenderBox renderBox = _key.currentContext.findRenderObject();
    buttonSize = renderBox.size;
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
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: Color(0xFFF5C6373),
        borderRadius: _borderRadius,
      ),
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        color: Colors.white,
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
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: ArrowClipper(),
                    child: Container(
                      width: 17,
                      height: 17,
                      color: backgroundColor ?? Color(0xFFF),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: flags.length * buttonSize.height,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: _borderRadius,
                    ),
                    child: Theme(
                      data: ThemeData(
                        iconTheme: IconThemeData(
                          color: iconColor,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(flags.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              languageController.setLanguage(Language.languages[index]);
                              closeMenu();
                            },
                            child: Container(
                              width: buttonSize.width,
                              height: buttonSize.height,
                              child: flags[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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