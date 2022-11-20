import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  final List<List<String>> data;
  const Leaderboard({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(40),
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
                      Text(data[1][1]),
                      Text(data[1][2]),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/gold.png"),
                      width: 64,
                    ),
                    Text(data[0][1]),
                    Text(data[0][2]),
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
                      Text(data[2][1]),
                      Text(data[2][2]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Table(
              children: List.generate(10, (index) {
                return TableRow(
                    children: [
                      TableCell(
                        child: Text(data[index][0]),
                      ),
                      TableCell(
                        child: Text(data[index][1]),
                      ),
                      TableCell(
                        child: Text(data[index][2]),
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
