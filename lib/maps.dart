import 'dart:async';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hacks/loc.dart';
import 'package:hacks/globals.dart' as globals;


class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final url = 'https://hacktum-highway.herokuapp.com/get_issues_location';
  var _data = [];
  var _data1 = [
    [11.61430161647961,48.111355593621],
    [11.606248275586244,48.17566584451249],
  [11.63329945842623,48.13569262741428],
  [11.58813361092573,48.1765304782419],
  [11.570784175202212,48.14912076050485],
  [11.60678544203654,48.17607553069282],
  [11.5806306,48.106241100000005],
  [11.613351477617488,48.13046701048668],
  [11.622674470519335,48.16163430223077],
  [11.608645678780396,48.172420882348],
  [11.547805204701106,48.11291668736461],
  [11.6237920164228,48.16265466072837],
  [11.61900312193212,48.118031503459626],
  [11.60673962645799,48.17604819685549],
  [11.62046123985182,48.12177302648248],
  [11.615932367309346,48.11290549141834],
  [11.61818097587384,48.11925483880852],
  [11.616833182061308,48.16881681797188],
  [11.5873091,48.104692400000005],
  [11.603695515414293,48.17208671297508],
  [11.615292419261202,48.11211300211448],
  [11.525206316022905,48.14868644684231],
  [11.601411486290576,48.171796512604],
  [11.549527023953246,48.16089514763812],
  [11.618987385257748,48.11835266871433],
  [11.624135105357796,48.16302274431093],
  [11.541217267708962,48.10089803370931],
  [11.617648147817643,48.11503273780353],
  [11.613106928911195,48.17299008497127],
  [11.527965543942017,48.14774795111176],
  ];
  var _words = [
    "Welcome to the quest!",
    "Once he reached the McHenry house to deliver a package at 59, Rupertigaustra\u00dfe, Jack parked on the dirt road, accidentally hitting a tire on the garden hose. shortly after getting out of the car, having retrieved the parcel from the trunk and having walked towards the house, Jack noticed the water hose, but he did not give it importance as he heard Mrs. McHencry lying on the floor by the stove.",
    "Jack rushed to her, he says and was trying to revive her when Mr. McHenry came through the door of the garage. McHenry had taken the day off to water his backyard garden. He had been hosing down his flowerbeds and hedges for half an hour when he noticed the truck in his garage. He walked over to investigate.",
    "Solution: McHenry, while throttling his wife, had been surprised by the arrival of the deliveryman and had hurried to the backyard and his alibi of hosing his garden.  Had he been there all the time, he would have investigated why the water stopped flowing. The truck wheels were parked on the garden hose for 'about two minutes,' remember?",
    "Here is your reward!",
  ];

  List<Marker> _markers = [

  ];

  List<Marker> _markers1 = [

  ];

  int _pos = globals.pos;

  void fetchData() {
    // try{
    //   final response = await http.get(Uri.parse(url));
    //   final jsonData = jsonDecode(response.body) as List;
    //   setState(() {
    //     _data = jsonData;
    //     _markers = _data.map((e) => Marker(
    //       point: LatLng(double.parse(e[0].toString()), double.parse(e[1].toString())),
    //       width: 60,
    //       height: 60,
    //       builder: (context) =>
    //           InkWell(
    //             onTap: () {
    //               showDialog(
    //                   context: context,
    //                   builder: (BuildContext context) {
    //                     return AlertDialog(
    //                       title: Text("Submit photo"),
    //                       content: Text("Submit photo for the current issue using your camera."),
    //                       actions: [
    //                         TextButton(
    //                             onPressed: () async{
    //                                 final ImagePicker _picker = ImagePicker();
    //                                 final XFile? result = await _picker.pickImage(source: ImageSource.camera);
    //                                 if (result == null) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //                                     content: Text('No image was received')));
    //                                 else {
    //                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //                                       content: Text('Thank you very much!')));
    //                                   globals.balance += 100;
    //                                   Navigator.of(context, rootNavigator: true).pop(result);
    //                                 }
    //                               },
    //                             child: Text("Take photo")
    //                         )
    //                       ],
    //                     );
    //                   }
    //               );
    //             },
    //             child:Icon(
    //             Icons.pin_drop,
    //             size: 60,
    //             color: Colors.redAccent,
    //           ),))).toList();
    //   });
    //   print(_data);
    // } catch(err) {
    //
    // }
    setState(() {
      _pos = globals.pos;
      _markers1 = _data1.map((e) => Marker(
          point: LatLng(e[1], e[0]),
          width: 60,
          height: 60,
          builder: (context) =>
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Submit photo"),
                          content: Text("Submit photo for the current issue using your camera."),
                          actions: [
                            TextButton(
                                onPressed: () async{
                                  final ImagePicker _picker = ImagePicker();
                                  final XFile? result = await _picker.pickImage(source: ImageSource.camera);
                                  if (result == null) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('No image was received')));
                                  else {
                                    Navigator.of(context, rootNavigator: true).pop(result);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Thank you very much!')));
                                    globals.balance += 100;
                                    globals.pos += 1;
                                    _pos += 1;
                                    if (_pos <= 4) {
                                      _markers = _markers1;
                                      print(globals.pos);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("Step $_pos/5"),
                                            content: Text(_words[_pos-1]),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.of(context, rootNavigator: true).pop(result),
                                                child: Text("Continue"),
                                              )
                                            ],
                                          );
                                        }
                                      );
                                    } else if (_pos == 5) {
                                      _markers = _markers1;
                                      print(_pos);
                                      globals.balance += 300;
                                      print(globals.balance);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Step $_pos/5"),
                                          content: Text(_words[_pos-1]),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.of(context, rootNavigator: true).pop(result),
                                              child: Text("Wow!"),
                                            )
                                          ],
                                        );
                                      } );
                                    } else{
                                      _markers = _markers1;
                                    }

                                  }
                                },
                                child: Text("Take photo")
                            )
                          ],
                        );
                      }
                  );
                },
                child:Icon(
                  Icons.pin_drop,
                  size: 60,
                  color: Colors.redAccent,
                ),))).toList();
      _markers = _markers1;
    });

  }

  MapController _mapController = MapController();

  int cnt = 0;

  Position? _currentPosition;

  Timer? _timer;

  @override
  void initState() {
    fetchData();

    _getCurrentPosition();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _getCurrentPosition();
      });
    });

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

    Future<bool> _handleLocationPermission() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')));
        return false;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Location permissions are denied')));
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Location permissions are permanently denied, we cannot request permissions.')));
        return false;
      }  return true;
    }

    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();  if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
            _currentPosition = position;
      }).catchError((e) {
        debugPrint(e);
      });
    }
    @override
    Widget build(BuildContext context) {
      _pos = globals.pos;
      LatLng currentLatLng;
      if (_currentPosition != null) {
        currentLatLng =
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
        if(cnt < 1) {
          _mapController.move(currentLatLng, 13.0);
          cnt += 1;
        }
      } else {
        currentLatLng = LatLng(0, 0);
      }
      return Center(
            child: Stack(
              children: [
                FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      plugins: [MarkerClusterPlugin(),],
                      center: LatLng(48.1351, 11.5820),
                      zoom: 69,
                    ),
                    layers: [
                      TileLayerOptions(
                        backgroundColor: Colors.black,
                        urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerClusterLayerOptions(
                        maxClusterRadius: 190,
                        disableClusteringAtZoom: 16,
                        size: Size(50, 50),
                        fitBoundsOptions: FitBoundsOptions(
                          padding: EdgeInsets.all(50),
                        ),
                        markers: _markers + [Marker(
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          point: currentLatLng,
                          width: 60,
                          height: 60,
                          builder: (context) =>
                              Image(
                                image:AssetImage(globals.paths[globals.cur-1]),
                              ),
                        ),

                        ],
                        polygonOptions: PolygonOptions(
                            borderColor: Colors.blueAccent,
                            color: Colors.black12,
                            borderStrokeWidth: 3),
                        builder: (context, markers) {
                          return Container(
                            alignment: Alignment.center,
                            decoration:
                            BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                            child: Text('${markers.length}'),
                          );
                        },
                      ),
                    ]
                ),
            ])
        );
    }
  }


