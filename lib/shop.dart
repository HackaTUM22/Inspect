import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Column(
          children: [
            Text("My Profile",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:40,
            )),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/ava1.png"),
                  width: 150,
                ),
                Column(
                  children: [
                    Text("Tasks completed today: ",),
                    Text("Balance: ")
                  ],
                )
              ],
              )  )
          ],
        );
  }
}