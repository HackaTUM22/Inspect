import 'package:flutter/material.dart';
import 'package:hacks/leaderboard.dart';

class Leader extends StatefulWidget {
  const Leader({Key? key}) : super(key: key);

  @override
  State<Leader> createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {
  int _selectedIndex = 0;

  List<List<String>> data1 = [
    ["1", "Mike", "1000"],
    ["2", "Mike", "900"],
    ["3", "Mike", "800"],
    ["4", "Mike", "700"],
    ["5", "Mike", "600"],
    ["6", "Mike", "500"],
    ["7", "Mike", "400"],
    ["8", "Mike", "300"],
    ["9", "Mike", "200"],
    ["10", "Mike", "100"],
  ];

  List<List<String>> data2 = [
    ["1", "Andrew", "1000"],
    ["2", "Andrew", "900"],
    ["3", "Andrew", "800"],
    ["4", "Andrew", "700"],
    ["5", "Andrew", "600"],
    ["6", "Andrew", "500"],
    ["7", "Andrew", "400"],
    ["8", "Andrew", "300"],
    ["9", "Andrew", "200"],
    ["10", "Andrew", "100"],
  ];

  final List<Widget> _widgets = [

  ];

  @override
  Widget build(BuildContext context) {
    _widgets.add(Leaderboard(data: data1));
    _widgets.add(Leaderboard(data: data2));
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: () => _selectedIndex = 0, child: Text('Weekly')),
              ElevatedButton(onPressed: () => _selectedIndex = 1, child: Text('All-time')),
            ],
          ),

          _widgets[_selectedIndex],
        ]
      )
    );
  }
}