import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import '../../constant/constant.dart';
import '../../repository/models/report.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReportsPage());
  }

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<ReportModel> _reportModelList = reportData;

  Widget _buildFinancialList(series) {
    return _reportModelList != null
        ? ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
              height: 5,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.height / 2.3,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_reportModelList[index].assesment,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Expanded(child: charts.BarChart(series, animate: true)),
                  ],
                ),
              );
            },
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ReportModel, String>> series = [
      charts.Series(
          id: "Assessment Report",
          data: _reportModelList,
          domainFn: (ReportModel series, _) => series.assesment,
          measureFn: (ReportModel series, _) => series.score,
          colorFn: (ReportModel series, _) => series.color),
    ];

    return Scaffold(
        backgroundColor: primarycolor_light,
        appBar: AppBar(
          title: const Text('Reports'),
          backgroundColor: secondarycolor_light,
        ),
        body: _buildFinancialList(series));
  }
}
