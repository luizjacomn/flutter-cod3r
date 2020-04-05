import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import 'package:my_money_control/widgets/resume_chip.dart';

class ResumeTile extends StatelessWidget {
  final int resumeDays;
  final double resumeInValue;
  final double resumeOutValue;

  const ResumeTile({
    @required this.resumeDays,
    @required this.resumeInValue,
    @required this.resumeOutValue,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.495;
        return Material(
          child: ListTileTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ExpansionTile(
              title: Text('Resumo dos últimos $resumeDays dias'),
              trailing: Text(''),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SlideInLeft(
                      child: ResumeChip(
                        width: width,
                        side: Side.Left,
                        label: 'Receitas',
                        resumeValue: resumeInValue,
                        valueColor: Colors.green,
                      ),
                    ),
                    SlideInRight(
                      child: ResumeChip(
                        width: width,
                        side: Side.Right,
                        label: 'Despesas',
                        resumeValue: resumeOutValue,
                        valueColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
