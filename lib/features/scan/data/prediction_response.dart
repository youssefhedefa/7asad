
import 'package:json_annotation/json_annotation.dart';
part 'prediction_response.g.dart';

// @JsonSerializable()
// class PredictionResponse {
//   @JsonKey(name: 'Prediction')
//   final String prediction;
//   final double confidence;
//
//   PredictionResponse({required this.prediction,required this.confidence});
//
//   factory PredictionResponse.fromJson(Map<String, dynamic> json) => _$PredictionResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$PredictionResponseToJson(this);
//
// }

@JsonSerializable()
class PredictionResponse {
  PredictionResponse({
    required this.prediction,
  });

  final String? prediction;
  static const String predictionKey = "prediction";


  factory PredictionResponse.fromJson(Map<String, dynamic> json) => _$PredictionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionResponseToJson(this);

}
