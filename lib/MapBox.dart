import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapBox extends StatefulWidget {
  const MapBox({Key? key}) : super(key: key);

  @override
  State<MapBox> createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {
  int _index = 0;
  final TextEditingController _searchController = TextEditingController();

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
  List<Marker> allMarkers = [];
  String _mapUrl =
      "https://api.mapbox.com/styles/v1/pagman/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  String _mapStyle = 'ckzgtk6sq008w14l8xk4i4187';

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final r = Random();
      for (var x = 0; x < 5; x++) {
        allMarkers.add(
          Marker(
            point: LatLng(
              doubleInRange(r, 37, 55),
              doubleInRange(r, -9, 30),
            ),
            builder: (context) => const Icon(
              Icons.circle,
              color: Colors.red,
              size: 12,
            ),
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              maxZoom: 18,
              center: LatLng(38.459831, 23.590091),
              zoom: 17,
            ),
            children: [
              TileLayer(
                urlTemplate: _mapUrl,
                additionalOptions: {
                  'mapStyleId': _mapStyle,
                  'accessToken':
                      'pk.eyJ1IjoicGFnbWFuIiwiYSI6ImNremd0aHVmcjAyZ2oyb25rYXAwcTlqdDYifQ.pBEsU52i5bodr7l2yA-uhA',
                },
              ),
              MarkerLayer(markers: allMarkers),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        print(_searchController.text);
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80, // card height
                child: PageView.builder(
                  itemCount: 10,
                  controller: PageController(viewportFraction: 0.2),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Lost ${i + 1}",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
