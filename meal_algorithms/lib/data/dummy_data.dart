import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
import 'package:meal_algorithms/models/category.dart';
 
const DUMMY_CATEGORIES = const [
  const Category(
    id: 'c1',
    title: 'Italiana',
    color: Colors.purple,
    icon: FontAwesomeIcons.pizzaSlice,
  ),
  const Category(
    id: 'c2',
    title: 'Rápida & Fácil',
    color: Colors.red,
    icon: FontAwesomeIcons.fastForward,
  ),
  const Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.blueGrey,
    icon: FontAwesomeIcons.hamburger,
  ),
  const Category(
    id: 'c4',
    title: 'Alemã',
    color: Colors.green,
    icon: FontAwesomeIcons.beer,
  ),
  const Category(
    id: 'c5',
    title: 'Leve & Saudável',
    color: Colors.amber,
    icon: FontAwesomeIcons.heartbeat,
  ),
  const Category(
    id: 'c6',
    title: 'Exótica',
    color: Colors.indigo,
    icon: FontAwesomeIcons.pastafarianism,
  ),
  const Category(
    id: 'c7',
    title: 'Café da Manhã',
    color: Colors.lightBlue,
    icon: FontAwesomeIcons.utensilSpoon,
  ),
  const Category(
    id: 'c8',
    title: 'Asiática',
    color: Colors.lightGreen,
    icon: FontAwesomeIcons.fish,
  ),
  const Category(
    id: 'c9',
    title: 'Francesa',
    color: Colors.pink,
    icon: FontAwesomeIcons.poundSign,
  ),
  const Category(
    id: 'c10',
    title: 'Verão',
    color: Colors.teal,
    icon: FontAwesomeIcons.solidSun,
  ),
];
