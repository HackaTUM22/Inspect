import 'package:flutter/material.dart';
import 'package:hacks/globals.dart' as globals;

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String _curPath = globals.paths[globals.cur];
  int _curBalance = globals.balance;
  int _cur = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40),
          height: 330,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Column(
            children: [
              Image(
                image: AssetImage(_curPath),
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
        const Padding(
          padding: EdgeInsets.all(30),
          child: Text(
              "Shop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )
          ),
        ),
        Text("Balance: ${_curBalance}"),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (!globals.owned.contains(1)) {
                          globals.balance -= 150;
                          globals.owned.add(1);
                          globals.cur = 1;
                          setState(() {
                            _cur = 1;
                            _curBalance = globals.balance;
                            _curPath = globals.paths[_cur - 1];
                          });
                        } else {
                          globals.cur = 1;
                          setState(() {
                            _cur = 1;
                            _curPath = globals.paths[_cur - 1];
                          });
                        }
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/ava1.png"),
                            width: 150,
                          ),
                          Text("Lafayette", style: TextStyle(
                              fontWeight: FontWeight.bold)),
                          globals.owned.contains(1) ? (_cur == 1 ? Text(
                              "Selected") : Text("Owned")) : Text("Price: 150"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (!globals.owned.contains(2)) {
                          globals.balance -= 150;
                          globals.owned.add(2);
                          globals.cur = 2;
                          setState(() {
                            _cur = 2;
                            _curBalance = globals.balance;
                            _curPath = globals.paths[_cur - 1];
                          });
                        } else {
                          globals.cur = 2;
                          setState(() {
                            _cur = 2;
                            _curPath = globals.paths[_cur - 1];
                          });
                        }
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/ava2.png"),
                            width: 150,
                          ),
                          Text("Joe", style: TextStyle(fontWeight: FontWeight
                              .bold)),
                          globals.owned.contains(2) ? (_cur == 2 ? Text(
                              "Selected") : Text("Owned")) : Text("Price: 150"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (!globals.owned.contains(3)) {
                              globals.balance -= 150;
                              globals.owned.add(3);
                              globals.cur = 3;
                              setState(() {
                                _cur = 3;
                                _curBalance = globals.balance;
                                _curPath = globals.paths[_cur - 1];
                              });
                            } else {
                              globals.cur = 3;
                              setState(() {
                                _cur = 3;
                                _curPath = globals.paths[_cur - 1];
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage("assets/images/ava3.png"),
                                width: 150,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text("Sherlok", style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                              ),
                              globals.owned.contains(3) ? (_cur == 3 ? Text(
                                  "Selected") : Text("Owned")) : Text(
                                  "Price: 150"),
                            ],
                          )),
                      TextButton(
                        onPressed: () {
                          if (!globals.owned.contains(4)) {
                            globals.balance -= 150;
                            globals.owned.add(4);
                            globals.cur = 4;
                            setState(() {
                              _cur = 4;
                              _curBalance = globals.balance;
                              _curPath = globals.paths[_cur - 1];
                            });
                          } else {
                            globals.cur = 4;
                            setState(() {
                              _cur = 4;
                              _curPath = globals.paths[_cur - 1];
                            });
                          }
                        },
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage("assets/images/ava4.png"),
                              width: 150,
                            ),
                            Text("Mario", style: TextStyle(fontWeight: FontWeight
                                .bold)),
                            globals.owned.contains(4) ? (_cur == 4 ? Text(
                                "Selected") : Text("Owned")) : Text("Price: 150"),
                          ],
                        ),
                      )
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