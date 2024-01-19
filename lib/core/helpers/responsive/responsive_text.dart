import 'package:flutter/material.dart';

double getResponsiveFont({required BuildContext context,required double fontSize}){
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize*0.9;
  double upperLimit = fontSize*1.2;

  //log(responsiveFontSize.clamp(lowerLimit, upperLimit).toString());
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context){
  double width = MediaQuery.sizeOf(context).width;
  return width /500;

}