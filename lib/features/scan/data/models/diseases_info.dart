import 'package:image_picker/image_picker.dart';

class DiseaseInfoModel{
  final XFile image;
  final String diseaseName;
  final String symptoms;
  final String treatment;
  final String reasons;
  final String protection;

  DiseaseInfoModel({required this.image, required this.diseaseName, required this.symptoms, required this.treatment, required this.reasons, required this.protection});

}