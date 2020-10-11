import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/Leads.dart';

class LineChart extends StatelessWidget {
  List<charts.Series<Leads, num>> series = [];

  LineChart() {
    var data1 = [
      Leads(month: 1, quantity: 200),
      Leads(month: 2, quantity: 450),
      Leads(month: 3, quantity: 550),
      Leads(month: 4, quantity: 670),
      Leads(month: 5, quantity: 833),
      Leads(month: 6, quantity: 1120),
      Leads(month: 7, quantity: 1230),
      Leads(month: 8, quantity: 1463),
      Leads(month: 9, quantity: 1621),
      Leads(month: 10, quantity: 1710),
      Leads(month: 11, quantity: 1973),
      Leads(month: 12, quantity: 2197),
    ];

    series.add(
      charts.Series(
          id: "Leads got it",
          data: data1,
          domainFn: (Leads leads, _) => leads.month,
          measureFn: (Leads leads, _) => leads.quantity,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red)),
    );

    var data2 = [
      Leads(month: 1, quantity: 200 - 150),
      Leads(month: 2, quantity: 450 - 320),
      Leads(month: 3, quantity: 500 - 550),
      Leads(month: 4, quantity: 750 - 670),
      Leads(month: 5, quantity: 900 - 833),
      Leads(month: 6, quantity: 1100 - 1128),
      Leads(month: 7, quantity: 1250 - 1463),
      Leads(month: 8, quantity: 1400 - 1463),
      Leads(month: 9, quantity: 1600 - 1621),
      Leads(month: 10, quantity: 1700 - 1710),
      Leads(month: 11, quantity: 1850 - 1973),
      Leads(month: 12, quantity: 2000 - 2197),
    ];

    series.add(
      charts.Series(
          id: "Leads expected",
          data: data2,
          domainFn: (Leads leads, _) => leads.month,
          measureFn: (Leads leads, _) => leads.quantity,
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Leads",
            style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontFamily: "Nunito Regular",
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: charts.LineChart(
              this.series,
              defaultRenderer: charts.LineRendererConfig(
                includeArea: true,
                stacked: true,
              ),
              animate: true,
              animationDuration: Duration(milliseconds: 600),
              behaviors: [
                // charts.ChartTitle(
                //   "Conseguido",
                //   behaviorPosition: charts.BehaviorPosition.start,
                //   titleOutsideJustification:
                //       charts.OutsideJustification.middleDrawArea,
                // ),
                // charts.ChartTitle(
                //   "Esperado",
                //   behaviorPosition: charts.BehaviorPosition.end,
                //   titleOutsideJustification:
                //       charts.OutsideJustification.middleDrawArea,
                // ),
              ],
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 50, left: 20),
    );
  }
}
