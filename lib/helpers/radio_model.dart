import 'package:flutter/material.dart';

class RadioModel {
  String? name;
  String? imgurl;
  IconData? icon;
  String? stringval;
  int? intval;
  bool? isselected;

  RadioModel({
    this.name,
    this.isselected,
    this.imgurl,
    this.icon,
    this.stringval,
    this.intval,
  });
}
