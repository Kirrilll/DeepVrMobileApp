import 'package:flutter/cupertino.dart';

class Tab{
  String name;
  String label;
  Widget content;
  String assetIcon;

  Tab({required this.label, required this.name, required this.content, required this.assetIcon});
}
