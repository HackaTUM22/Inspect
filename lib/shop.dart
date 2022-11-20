import 'package:flutter/material.dart';
import 'package:hacks/globals.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return SingleChildScrollView(child:Column(
      children: [
        Container(
          padding: EdgeInsets.only(top : 40),
          height: 330,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/ava1.png"),
                width: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mike Trushch",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "43",
                        style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      Text("Tasks Completed",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("#335",
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.9))),
                      Text("Rank",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30),
          child: Text("My Profile",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:40,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/ava1.png"),
              width: 150,
            ),
            Column(
              children: const [
                Text("Tasks completed today: ",),
                Text("Balance: ")
              ],
            )
          ],
          )
        ),
        Text(
          "Shop",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize:40,
          )
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Image(
                          image: AssetImage("assets/images/ava1.png"),
                          width: 150,
                        ),
                        Text("Lafayette", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price: 150"),
                      ],
                    ),
                    Column(
                      children: const [
                        Image(
                          image: AssetImage("assets/images/ava2.png"),
                          width: 150,
                        ),
                        Text("Joe", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price: 150"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Image(
                          image: AssetImage("assets/images/ava3.png"),
                          width: 150,
                        ),
                        Text("Sherlok", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price: 150"),
                      ],
                    ),
                    Column(
                      children: const [
                        Image(
                          image: AssetImage("assets/images/ava4.png"),
                          width: 150,
                        ),
                        Text("Mario", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price: 150"),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        )
      ],
    ));
  }
}