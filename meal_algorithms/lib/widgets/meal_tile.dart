import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:meal_algorithms/models/meal.dart';

import 'package:meal_algorithms/pages/meal_detail_page.dart';

class MealTile extends StatelessWidget {
  final Meal meal;

  const MealTile({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MealDetailPage.route,
            arguments: meal,
          );
        },
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: meal.imageURL,
                      height: size.height / 3,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                        height: size.height / 3,
                        child: Center(child: const CircularProgressIndicator()),
                      ),
                      errorWidget: (_, __, ___) => Icon(Icons.broken_image),
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 8.0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      width: size.width * 2 / 3,
                      color: Colors.black54,
                      child: Text(
                        meal.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MealDetailItem(
                      icon: FontAwesomeIcons.clock,
                      label: '${meal.duration.inMinutes} min.',
                      tooltipMessage: 'Tempo de preparo',
                    ),
                    MealDetailItem(
                      icon: FontAwesomeIcons.dumbbell,
                      label: meal.complexityLabel,
                      tooltipMessage: 'Complexidade de preparo',
                    ),
                    MealDetailItem(
                      icon: FontAwesomeIcons.dollarSign,
                      label: meal.costLabel,
                      tooltipMessage: 'Custo de preparo',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final double spaceBetween;
  final String tooltipMessage;

  const MealDetailItem({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.tooltipMessage,
    this.spaceBetween: 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: Row(
        children: <Widget>[
          FaIcon(icon),
          SizedBox(width: spaceBetween),
          Text(label),
        ],
      ),
    );
  }
}
