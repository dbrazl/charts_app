import 'package:flutter/material.dart';
import '../components/NavigatorBar.dart';
import '../components/BarChart.dart';
import '../components/PieChart.dart';
import '../components/LineChart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: NavigatorBar(),
        body: TabBarView(
          children: <Widget>[
            BarChart(),
            PieChart(),
            LineChart(),
          ],
        ),
      ),
    );
  }
}
