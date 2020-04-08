import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool venceu;
  final Function aoReiniciar;

  const ResultadoWidget({
    @required this.venceu,
    @required this.aoReiniciar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: _cor,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                _icon,
                color: Colors.black,
                size: 32.0,
              ),
              onPressed: aoReiniciar,
            ),
          ),
        ),
      ),
    );
  }

  Color get _cor {
    if (venceu == null) {
      return Colors.yellowAccent;
    } else if (venceu) {
      return Colors.greenAccent;
    } else {
      return Colors.redAccent;
    }
  }

  IconData get _icon {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
