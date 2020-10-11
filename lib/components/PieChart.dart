import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../models/Departament.dart';

class PieChart extends StatelessWidget {
  List<charts.Series<Departament, String>> series = [];

  var data = [
    Departament(
      name: 'TI',
      personQuantity: 53,
      colorValue: Colors.redAccent,
    ),
    Departament(
      name: 'Marketing',
      personQuantity: 15,
      colorValue: Colors.purple,
    ),
    Departament(
      name: 'Recursos Humanos',
      personQuantity: 5,
      colorValue: Colors.yellow,
    ),
    Departament(
      name: 'Comercial',
      personQuantity: 30,
      colorValue: Colors.blue,
    ),
  ];

  PieChart() {
    series.add(
      charts.Series(
        data: data,
        domainFn: (Departament departament, _) => departament.name,
        measureFn: (Departament departament, _) => departament.personQuantity,
        colorFn: (Departament departament, _) =>
            charts.ColorUtil.fromDartColor(departament.colorValue),
        id: "Employees",
        labelAccessorFn: (Departament departament, _) =>
            "${departament.personQuantity}",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Colaboradores",
            style: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontFamily: "Nunito Regular",
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: charts.PieChart(
              this.series,
              animate: true,
              animationDuration: Duration(milliseconds: 600),
              behaviors: [
                charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  cellPadding: EdgeInsets.only(right: 10, bottom: 10),
                  entryTextStyle: charts.TextStyleSpec(
                    color: charts.ColorUtil.fromDartColor(Colors.black),
                    fontFamily: "Nunito Regular",
                    fontSize: 18,
                  ),
                ),
              ],
              defaultRenderer: charts.ArcRendererConfig(
                arcWidth: 100,
                arcRendererDecorators: [
                  charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.inside,
                    insideLabelStyleSpec: charts.TextStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.white),
                      fontFamily: "Nunito Regilar",
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 50),
    );
  }
}
