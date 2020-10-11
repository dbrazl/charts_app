import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(
          icon: Icon(
            Feather.bar_chart_2,
            color: Colors.black,
          ),
        ),
        Tab(
          icon: Icon(
            Feather.pie_chart,
            color: Colors.black,
          ),
        ),
        Tab(
          icon: Icon(
            Feather.trending_up,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
