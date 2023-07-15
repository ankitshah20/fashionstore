import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  String? name;
  IconData? icon;
  Category({@required this.name, @required this.icon});
}

List<Category> categories = [
  Category(
    name: 'Men',
    icon: FontAwesomeIcons.male,
  ),
  Category(
    name: 'Women',
    icon: FontAwesomeIcons.female,
  ),

];

class Purpose {
  String? name;

  Purpose({@required this.name});
}

List<Purpose> purposes = [
  Purpose(
    name: 'Sales',
  ),
  Purpose(
    name: 'Reserved',
  ),
];
