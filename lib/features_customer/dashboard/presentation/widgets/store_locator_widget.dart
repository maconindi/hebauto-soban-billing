import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hebauto/core/util/ext/ext.dart';
import 'package:hebauto/core/util/map.dart';

import '../../../../core/components/dx_dropdown_search.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/config.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/decorations.dart';

const DEFAULT_MAP_ZOOM = 3.0;

class StoreLocatorWidget extends StatefulWidget {
  const StoreLocatorWidget({
    super.key,
  });

  @override
  State<StoreLocatorWidget> createState() => _StoreLocatorWidgetState();
}

class _StoreLocatorWidgetState extends State<StoreLocatorWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0, 0),
    zoom: 3,
  );

  BitmapDescriptor? bitmapDescriptor;

  bool isCanada = true;

  Set<Marker> mapMarkers = {};

  // Set<Marker> canadaStoreMarkers =  {
  //   Marker(
  //   markerId: const MarkerId('USA - Orlando, FL, USA'),
  //   position: const LatLng(28.538336, -81.379234),
  //   icon: widget.bitmapDescriptor ?? BitmapDescriptor.defaultMarker,
  // )
  // };

  Future<void> animateCamera(LatLng target,
      {double zoom = DEFAULT_MAP_ZOOM}) async {
    //await Future.delayed(Duration(milliseconds: 1));
    final controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: target,
          zoom: zoom,
        ),
      ),
    );
  }

  Future<void> initStoreMarkers() async {
    List<Map<String, LatLng>> canadaMarkerList = [
      {
        'Edmonton': const LatLng(51.044270, -114.062019),
      },
      {
        'Toronto': const LatLng(43.897095, -78.865791),
      },
      {
        'Montreal': const LatLng(45.424721, -75.695000),
      },
      {
        'Sharjah': const LatLng(25.357119, 55.391068),
      },
      {
        'Orlando': const LatLng(28.538336, -81.379234),
      },
    ];
    List<Future> futures = [];

    canadaMarkerList.forEach((element) {
      Future future = getMarker(element.entries.first.key,
          element[element.entries.first.key] ?? const LatLng(0, 0));
      futures.add(future.then((marker) {
        // Add the marker to the list of store markers

        mapMarkers.add(marker);
      }));
    });

    Future.wait(futures).then((value) => {
          animateCamera(const LatLng(50.044270, -90.062019)),
          setState(() {}),
        });
  }

  // Future<void> initUAEStoreMarkers() async {
  //   List<Map<String, LatLng>> uaeMarkerList = [
  //     {
  //       'Sharjah': const LatLng(25.357119, 55.391068),
  //     },
  //   ];
  //   List<Future> futures = [];
  //
  //   uaeMarkerList.forEach((element) {
  //     Future future = getMarker(element.entries.first.key,
  //         element[element.entries.first.key] ?? const LatLng(0, 0));
  //     futures.add(future.then((marker) {
  //       // Add the marker to the list of store markers
  //
  //       mapMarkers.add(marker);
  //     }));
  //   });
  //
  //   Future.wait(futures).then((value) => {
  //         //animateCamera(const LatLng(25.357119, 55.391068)),
  //         setState(() {}),
  //       });
  // }
  //
  // Future<void> initUSAStoreMarkers() async {
  //   List<Map<String, LatLng>> usaMarkerList = [
  //     {
  //       'Orlando': const LatLng(28.538336, -81.379234),
  //     },
  //   ];
  //   List<Future> futures = [];
  //   usaMarkerList.forEach((element) {
  //     Future future = getMarker(element.entries.first.key,
  //         element[element.entries.first.key] ?? const LatLng(0, 0));
  //     futures.add(future.then((marker) {
  //       // Add the marker to the list of store markers
  //
  //       mapMarkers.add(marker);
  //     }));
  //   });
  //   Future.wait(futures).then((value) => {
  //         //animateCamera(const LatLng(28.538336, -81.379234)),
  //         setState(() {}),
  //       });
  // }

  @override
  void initState() {
    super.initState();
    initStoreMarkers();
    // initUAEStoreMarkers();
    // initUSAStoreMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 370,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: boxDecorationRoundedWithShadow(
        defaultItemsRadius.toInt(),
      ),
      child: Column(
        children: [
          defaultWidgetsVerticalSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Store Locations',
                style: TextStyle(fontWeight: FontWeight.bold),
              ).expand(),
              SizedBox(
                width: 140,
                child: DropDownSearchWidget(
                  disableSearch: true,
                  filled: false,
                  dropDownType: DropDownType.LOCATION_FILTER,
                  callback: (type, args) {
                    if (type == 'CANADA') {
                      animateCamera(const LatLng(50.044270, -90.062019));
                    } else if (type == 'UAE') {
                      animateCamera(const LatLng(25.357119, 55.391068));
                    } else {
                      animateCamera(const LatLng(28.538336, -81.379234));
                    }
                    // setState(() {});
                  },
                ),
              )
            ],
          ),
          defaultWidgetsVerticalSpacing,
          defaultWidgetsVerticalSpacing,
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            markers: mapMarkers,
            onMapCreated: _controller.complete,
          ).expand(),
        ],
      ),
      //child:
    );
  }

  Future<Marker> getMarker(String location, LatLng latLng) async {
    //BitmapDescriptor? descriptor;
    //descriptor = await getCustomIcon(location);
    return Marker(
      markerId: MarkerId(location),
      position: latLng,
    );
  }

  Future<BitmapDescriptor> getCustomIcon(String location) async {
    Color inner = grey;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 65,
          width: 15,
          decoration: boxDecorationWithRoundedCorners(
            border: Border.all(color: inner),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          decoration: boxDecorationWithRoundedCorners(
            border: Border.all(color: inner),
          ),
          height: 40,
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                height: 30,
                width: 30,
                //color: redColor,
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: inner,
                  //border: Border.all(color: redColor, width: 2),
                ),
                child: const Icon(
                  Icons.map_outlined,
                  color: whiteColor,
                ),
              ),
              10.width,
              Text(
                location,
                style: TextStyle(color: inner, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    ).toBitmapDescriptor();
  }
}
