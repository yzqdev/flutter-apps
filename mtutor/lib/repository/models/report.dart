import 'package:charts_flutter/flutter.dart' as charts;

class ReportModel {
  String assesment;
  int score;
  final charts.Color color;

  ReportModel({
    required this.assesment,
    required this.score,
    required this.color,
  });
}
