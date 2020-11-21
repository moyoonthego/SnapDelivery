import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart' as Constants;

// This widget is for store banner photos or item banners
class StyledMapView extends StatelessWidget {
  StyledMapView(
      {@required this.location,
      this.width = 320,
      this.height = 140,
      this.zoom = 15,
      this.marker});

  final double width;
  final double height;
  final double zoom;
  Icon marker;
  LatLng location;

  goToMaps() async {
    String strlat = location.latitude.toString();
    String strlong = location.longitude.toString();
    String url =
        'https://www.google.com/maps/search/?api=1&query=' + '$strlat,$strlong';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.marker == null) {
      this.marker = Icon(Icons.location_pin, color: Constants.YELLOW, size: 30);
    }

    return new GestureDetector(
        onTap: goToMaps,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            child: SizedBox(
                width: width,
                height: height,
                child: FlutterMap(
                  options: new MapOptions(
                    center: location,
                    zoom: zoom,
                  ),
                  layers: [
                    new TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 30.0,
                          height: 30.0,
                          point: location,
                          builder: (ctx) => new Container(
                            child:
                                GestureDetector(onTap: goToMaps, child: marker),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
