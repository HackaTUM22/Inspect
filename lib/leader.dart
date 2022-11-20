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
    ["1", "Mike", "10000"],
    ["2", "Mauro", "9000"],
    ["3", "Gioele", "8000"],
    ["4", "Luke", "7000"],
    ["5", "Sarah", "6000"],
    ["6", "Jake", "5000"],
    ["7", "Laura", "4000"],
    ["8", "Silvan", "3000"],
    ["9", "Laura", "2000"],
    ["10", "Nicolas", "1000"],
  ];

  List<List<String>> data2 = [
    ["1", "Sarah", "1000"],
    ["2", "Mauro", "900"],
    ["3", "Silvan", "800"],
    ["4", "Jake", "700"],
    ["5", "Laura", "600"],
    ["6", "Andrew", "500"],
    ["7", "Gioele", "400"],
    ["8", "Mike", "300"],
    ["9", "Nicolas", "200"],
    ["10", "Luke", "100"],
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