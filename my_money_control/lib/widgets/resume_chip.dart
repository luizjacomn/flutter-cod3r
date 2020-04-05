import 'package:flutter/material.dart';

import 'package:my_money_control/utils/format.dart';

enum Side { Left, Right }

class ResumeChip extends StatelessWidget {
  final double width;
  final Side side;
  final String label;
  final double resumeValue;
  final Color valueColor;

  const ResumeChip({
    @required this.width,
    @required this.side,
    @required this.label,
    @required this.resumeValue,
    @required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _buildAlignment(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 50.0,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: _buildBorderRadius(),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _widgets(context),
            ),
          ),
        ),
      ),
    );
  }

  Alignment _buildAlignment() {
    return Side.Left == side ? Alignment.centerLeft : Alignment.centerRight;
  }

  BorderRadius _buildBorderRadius() {
    return Side.Left == side
        ? BorderRadius.only(
            topRight: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(24.0),
            bottomLeft: Radius.circular(24.0),
          );
  }

  List<Widget> _widgets(context) {
    final list = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Chip(
          backgroundColor: Colors.white,
          label: Text(
            '${Format.currencyFormat(resumeValue)}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.0,
              color: valueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Text(
            label?.toUpperCase(),
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      ),
    ];

    return Side.Left == side ? list.reversed.toList() : list;
  }
}
