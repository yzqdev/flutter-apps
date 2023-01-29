import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import '../repository/models/Profile.dart';
import '../repository/models/report.dart';

//Light Theme
const primarycolor_light = Color(0xffe0f2f1);
const secondarycolor_light = Color(0xff4caf50);

//Dark Theme
const primarycolor_dark = Color(0xff2470c7);
const secondarycolor_dark = Color(0xff2470c7);

Map<String, bool> cand_list = {
  'Candidate1': false,
  'Candidate2': false,
  'Candidate3': false,
  'Candidate4': false,
  'Candidate5': false,
  'Candidate6': false,
  'Candidate7': false,
  'Candidate8': false,
  'Candidate9': false,
  'Candidate10': false,
  'Candidate11': false,
  'Candidate12': false,
  'Candidate13': false,
  'Candidate14': false,
  'Candidate15': false,
  'Candidate16': false,
  'Candidate17': false,
  'Candidate18': false,
  'Candidate19': false,
  'Candidate20': false,
};

Profile profile = Profile(
    id: "101",
    name: 'M-Tutor candidate',
    place: "Blore,India",
    dob: "05-Dec-2005",
    addrs: "My Address");

final List<ReportModel> reportData = [
  ReportModel(
    assesment: "Test1",
    score: 250,
    color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
  ),
  ReportModel(
    assesment: "Test2",
    score: 300,
    color: charts.ColorUtil.fromDartColor(Colors.red),
  ),
  ReportModel(
    assesment: "Test3",
    score: 200,
    color: charts.ColorUtil.fromDartColor(Colors.green),
  ),
  ReportModel(
    assesment: "Test4",
    score: 450,
    color: charts.ColorUtil.fromDartColor(Colors.yellow),
  ),
  ReportModel(
    assesment: "Test5",
    score: 375,
    color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
  ),
  ReportModel(
    assesment: "Test6",
    score: 410,
    color: charts.ColorUtil.fromDartColor(Colors.pink),
  ),
  ReportModel(
    assesment: "Test7",
    score: 220,
    color: charts.ColorUtil.fromDartColor(Colors.purple),
  ),
];
