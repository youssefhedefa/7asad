import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseInfoModel{
  final XFile image;
  final String diseaseName;
  final String factors;
  final String description;
  final String defaultCombat;
  final String chemicalCombat;
  final List<dynamic> similarImages;

  DiseaseInfoModel( {required this.similarImages,required this.image, required this.diseaseName, required this.factors, required this.description, required this.defaultCombat, required this.chemicalCombat});

}

class DiseaseDataClassification{
  static List diseaseData = [];

  static Future<void> loadJsonData() async {

    String jsonData = await rootBundle.loadString('assets/disease/diseases.json');

    Map<String, dynamic> data = json.decode(jsonData);

    diseaseData = data['data'];

  }

  // static String removeTomatoFromResponse({required String disease}) {
  //   if (disease.startsWith('Tomato___')) {
  //     return disease.substring('Tomato___'.length).replaceAll('_', ' ').replaceAll('-', ' ').toLowerCase();
  //   }
  //   return disease.replaceAll('_', ' ').toLowerCase();
  // }

}