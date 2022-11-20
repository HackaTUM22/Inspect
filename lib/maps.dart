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
  List<Marker> _markers = [];
  List<Loc> locs = [];
  void fetchData() async {
    try{
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;
      setState(() {
        _data = jsonData;
        _markers = _data.map((e) => Marker(
          point: LatLng(double.parse(e[0].toString()), double.parse(e[1].toString())),
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
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text('Thank you very much!')));
                                      globals.balance += 100;
                                      Navigator.of(context, rootNavigator: true).pop(result);
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
      });
      print(_data);
    } catch(err) {

    }

  }
  int _selectedIndex = 0;
  MapController _mapController = MapController();
  double _zoom = 7;
  List<LatLng> _latLngList = [
    LatLng(50.45, 30.52),
    LatLng(13.02, 77.51),
    LatLng(13.05, 77.53),
    LatLng(13.155, 77.54),
    LatLng(13.159, 77.55),
    LatLng(13.17, 77.55),
  ];

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
      LatLng currentLatLng;
      if (_currentPosition != null) {
        currentLatLng =
            LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!);
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
                      zoom: 50,
                    ),
                    layers: [
                      TileLayerOptions(
                        minZoom: 1,
                        maxZoom: 18,
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
                          point: currentLatLng,
                          width: 60,
                          height: 60,
                          builder: (context) =>
                              Image(
                                image:AssetImage("assets/images/ava1.png"),
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


