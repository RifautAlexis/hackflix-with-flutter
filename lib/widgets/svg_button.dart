import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback onPressed;

  const SvgButton(
      {Key key, @required this.svgPath, @required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: Align(
        alignment: Alignment.center,
        child: InkResponse(
          onTap: onPressed,
          child: SvgPicture.asset(
            svgPath,
            semanticsLabel: label,
          ),
        ),
      ),
    );
  }
}
