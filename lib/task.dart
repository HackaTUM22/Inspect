import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String name;
  final String subname;
  final String progress;
  const Task({Key? key,required this.name,required this.progress,required this.subname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:25.0, left: 10.0, right: 10.0, bottom: 10.0),
        child:
        Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                )
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 20,
                  right: 0,
                  bottom: 20,
                ),
                child: Text(
                    subname,
                    style: TextStyle(
                        fontSize: 16
                    )
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  color: Colors.blueGrey[400],
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: double.parse(progress),
                    child: Container(
                      color: Colors.amber[800],
                      height: 20,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "${(double.parse(progress) * 100).toStringAsFixed(2)}%",
                      style: TextStyle(
                        color: Colors.white,
                      )
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}