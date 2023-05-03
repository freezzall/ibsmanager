import 'dart:async';
import 'dart:math';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibsmanager/constant/constant.dart';
import 'package:ibsmanager/data/maps.dart';
import 'package:ibsmanager/providers/mapsProvider.dart';
import 'package:ibsmanager/widgets/dateformat.dart';
import 'package:ibsmanager/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../data/user.dart';

class mapscreen extends StatefulWidget {
  user? objUser;
  mapscreen({Key? key, this.objUser}) : super(key: key);

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  Color c = Colors.blue;
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = new Set();
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  BitmapDescriptor? myIcon;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/marker.png')
        .then((onValue) {
      myIcon = onValue;
    });
    final maps = Provider.of<mapsProvider>(context, listen: false);
    maps.getData(context, widget.objUser!.szId);
    addMarker(maps.model);
  }

  addMarker(List<OResult> model){
    setState(() {
    for (var x = 0; x < model.length; x++) {
      var v = model[x];
      BitmapDescriptor ic = getIcon(x);
      for (var vv in v.items!) {
        LatLng pos = LatLng(
            convertDouble(vv.szLatitude!),
            convertDouble(vv.szLongitude!)
        );

        markers.add(
          Marker(
            icon: ic,
            markerId: MarkerId(vv.szCustomerId.toString()),
            position: pos,
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "${v.szEmployeeNm}",
                                overflow: TextOverflow.clip,
                                style:
                                TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${vv.szCustomerId}",
                                overflow: TextOverflow.clip,
                                style:
                                TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${vv.szCustomerNm}",
                                overflow: TextOverflow.clip,
                                style:
                                TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "${dateFormat.timeOnly(vv.dtmFinish.toString())}",
                                overflow: TextOverflow.clip,
                                style:
                                TextStyle(
                                    color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
                pos,
              );
            },
          ),
        );

      }
    }
    });

    return markers;
  }


  @override
  void dispose() {
    super.dispose();
    _customInfoWindowController.dispose();
  }

  BitmapDescriptor getIcon(x){
    Random r = new Random();
    return BitmapDescriptor.defaultMarkerWithHue(constant.hues[x]);
  }

  double convertDouble(String s){
    if(s.isNotEmpty) {
      return double.parse(s);
    }else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final maps = Provider.of<mapsProvider>(context);

    return Scaffold(
      backgroundColor: c,
      appBar: AppBar(
        backgroundColor: c,
        title: Text("Map"),
        elevation: 0,
      ),
      body: maps.loading ? loading() : maps.model.length != 0 ?
      Stack(
        children: [
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                convertDouble(maps.model.first.items!.first.szLatitude!),
                convertDouble(maps.model.first.items!.first.szLongitude!)
              ),
              zoom: 13
            ),
            markers: markers,
            // onMapCreated: (GoogleMapController controller) {
            //   _controller.complete(controller);
            // },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 120,
            width: MediaQuery.of(context).size.width - 20,
            offset: 56,
          ),
        ],
      ) : Center(
        child: Text(
          'No data found',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

}
