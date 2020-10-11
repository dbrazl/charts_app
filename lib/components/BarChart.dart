import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/Sells.dart';

class BarChart extends StatelessWidget {
  List<charts.Series<Sells, String>> series = [];

  var data = [
    Sells(month: "Janeiro", value: 23680),
    Sells(month: "Fevereiro", value: 24513),
    Sells(month: "Março", value: 25430),
    Sells(month: "Abril", value: 25789),
    Sells(month: "Maio", value: 25320),
    Sells(month: "Junho", value: 21123),
    Sells(month: "Julho", value: 20364),
    Sells(month: "Agosto", value: 19780),
    Sells(month: "Setembro", value: 22470),
    Sells(month: "Outobro", value: 24780),
    Sells(month: "Novembro", value: 32780),
    Sells(month: "Janeiro", value: 28460),
  ];

  BarChart() {
    series.add(
      charts.Series(
          data: data,
          domainFn: (Sells sells, _) => sells.month,
          measureFn: (Sells sells, _) => sells.value,
          id: "Sells",
          fillPatternFn: (_, __) => charts.FillPatternType.solid,
          fillColorFn: (Sells sells, _) =>
              charts.ColorUtil.fromDartColor(Colors.blueAccent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Vendas",
            style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontFamily: "Nunito Regular",
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: charts.BarChart(
              this.series,
              animate: true,
              animationDuration: Duration(milliseconds: 600),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 50),
    );
  }
}
