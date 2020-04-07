import 'package:flutter/material.dart';

import 'package:meal_algorithms/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({@required this.category});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [
              category.color,
              category.color.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                Positioned(
                  bottom: 4.0,
                  right: 4.0,
                  child: Icon(
                    category.icon,
                    color: Colors.white30,
                    size: constraints.maxHeight,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Text(
                    category.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          blurRadius: 2.0,
                          spreadRadius: 5.0,
                          color: Colors.black,
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
