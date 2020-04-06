import 'package:flutter/material.dart';
import 'package:my_money_control/utils/styles.dart';

enum CornerRounded { Left, Right }

class CornerRoundedButton extends StatelessWidget {
  final CornerRounded cornerRounded;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String label;
  final IconData icon;
  final double cornerRadius;

  const CornerRoundedButton({
    Key key,
    @required this.cornerRounded,
    @required this.onPressed,
    @required this.backgroundColor,
    @required this.label,
    @required this.icon,
    this.cornerRadius: 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        width: size.width * 1 / 3,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: cornerRounded == CornerRounded.Left
              ? BorderRadius.only(topLeft: Radius.circular(cornerRadius))
              : BorderRadius.only(topRight: Radius.circular(cornerRadius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cornerRounded == CornerRounded.Left
              ? _widgets.reversed.toList()
              : _widgets,
        ),
      ),
    );
  }

  List<Widget> get _widgets {
    return [
      Text(
        label.toUpperCase(),
        style: boldTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
      const SizedBox(width: 8.0),
      Icon(
        icon,
        color: Colors.white,
      ),
    ];
  }
}
