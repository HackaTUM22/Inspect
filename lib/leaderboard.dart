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
        Column(
          children: List.generate(10, (index) =>
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 90, right: 30),
                      child: Text((index+1).toString())),
                    Padding (
                      padding: EdgeInsets.only(left: 30, right: 60),
                      child: Text(data[index][1])
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 90),
                    child: Text(data[index][2]),

                    )])
                ),

            )
          ]);
  }
}
