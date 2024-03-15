import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  const IconWidget({ required this.icon,required this.iconColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: FaIcon (
        icon,        color: iconColor,
      ),
    );
  }
}
