import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'utils/main.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage(this.title);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Map());
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  static const _initialPostion = LatLng(12.92, 77.02);
  LatLng _lastPostion = _initialPostion;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return _initialPostion == null
        ? Container(
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _lastPostion,
                  zoom: 10.0,
                ),
                onMapCreated: onCreated,
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
              // Positioned(
              //   top: 50.0,
              //   right: 15.0,
              //   child: FloatingActionButton(
              //     onPressed: _onAddMarkerPressed,
              //     tooltip: "add marker",
              //     backgroundColor: black,
              //     child: Icon(
              //       Icons.add_location,
              //       color: white,
              //     ),
              //   ),
              //),
              Positioned(
                top: 50.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, top: 5),
                        width: 10.0,
                        height: 10.0,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Pick up",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 105.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        icon: Container(
                          margin: EdgeInsets.only(left: 20, top: 5),
                          width: 10.0,
                          height: 10.0,
                          child: Icon(
                            Icons.local_taxi,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Destination?",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 16.0)),
                  ),
                ),
              )
            ],
          );
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {});
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onAddMarkerPressed() {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(
              _lastPostion.toString(),
            ),
            position: _lastPostion,
            infoWindow:
                InfoWindow(title: "Remeber here", snippet: "Good place"),
            icon: BitmapDescriptor.defaultMarker),
      );
    });
  }
}
