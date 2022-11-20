import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  final List<List<String>> data;
  const Leaderboard({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, right:40),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/silver.png"),
                        width: 64,
                      ),
                      Text(data[1][1], style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data[1][2], style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/gold.png"),
                      width: 64,
                    ),
                    Text(data[0][1], style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(data[0][2], style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 40),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/bronze.png"),
                        width: 64,
                      ),
                      Text(data[2][1], style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data[2][2], style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/5, right: MediaQuery.of(context).size.width/5, top: 20, bottom: 20),
          child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
                2: FlexColumnWidth(1),
              },
              children: List.generate(10, (index) {
                return TableRow(
                    children: [
                      TableCell(
                        child: Text(data[index][0], style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      TableCell(
                        child: Text(data[index][1], style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      TableCell(
                        child: Text(data[index][2], style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ]
                );
              })
          )
        )
      ]
    );
  }
}
