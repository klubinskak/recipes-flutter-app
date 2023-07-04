import 'package:flutter/material.dart';

class DietModel {
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.boxColor,
    required this.viewIsSelected,

  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(
       viewIsSelected: true,
       boxColor: Color(0xff9DCEFF)
      )
    );

    diets.add(
      DietModel(
       viewIsSelected: false,
       boxColor: Color(0xffEEA4CE)
      )
    );


    return diets;
  }
}
