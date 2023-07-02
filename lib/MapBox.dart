import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'globals.dart' as globals;
import 'model/Animals.dart';

class MapBox extends StatefulWidget {
  const MapBox({Key? key}) : super(key: key);

  @override
  State<MapBox> createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {


  final TextEditingController _searchController = TextEditingController();
  String _search = "";
  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;
  List<Marker> allMarkers = [];
  String _mapUrl =
      "https://api.mapbox.com/styles/v1/pagman/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  String _mapStyle = 'clagslxf6000r14n4zp7eiw7p';
  List<Animal> _filter = [];

  @override
  void initState() {
    super.initState();
    //readJson();
    Future.microtask(() {
      final r = Random();
      allMarkers.add(
        Marker(
            width: 50,
            height: 50,
            point: LatLng(globals.animals[0].lat, globals.animals[0].lon),
            builder: (ctx) => Container(
                key: Key('blue'), child: Image(image: AssetImage('1.png')))

        ),
      );
      for (var x = 0; x < globals.animals.length; x++) {
        allMarkers.add(
          Marker(
            width: 50,
              height: 50,
              point: LatLng(
                globals.animals[x].lat,
                globals.animals[x].lon
              ),
              builder: (ctx) => Container(
                  key: Key('blue'), child: Image(image: AssetImage(globals.animals[x].image)))),
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
              center: LatLng(38.462467, 23.607580),
              zoom: 15,
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
                    filled: true,
                    fillColor: Colors.grey[200],
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
                        _search = _searchController.text;
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
                child: ListView.builder(
                    itemCount: globals.animals.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                                  //margin: const EdgeInsets.all(20),
                                  child: SizedBox(
                                    width: 250,
                                    height: 80,
                                    child: ListTile(
                                      leading: Image.asset(globals.animals[index].image),
                                      title: Text(globals.animals[index].name),
                                      subtitle: Text(globals.animals[index].description),
                                    ),
                                  ),
                                );
                    }),
              ),
              // ListView.builder(
              //     itemCount: animals.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       Card(
              //         //margin: const EdgeInsets.all(20),
              //         child: SizedBox(
              //           width: 250,
              //           height: 100,
              //           child: ListTile(
              //             leading: Image.asset('1.png'),
              //             title: Text(animals[index].name),
              //             subtitle: Text('This is a simple card in Flutter.'),
              //           ),
              //         ),
              //       );
              //     }),
            ],
          )
        ],
      ),
    );
  }
}
