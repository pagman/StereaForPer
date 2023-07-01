import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stereaforpets/MapBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveNavBar(
        backgroundColor: Color(0xff2BD4DA),
        screenWidth: MediaQuery.of(context).size.width,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 8, color: Colors.white),
                borderRadius: BorderRadius.circular(100), //<-- SEE HERE
              ),
              child: Image.asset('logo.png'),
            ),
            Container(
                padding: const EdgeInsets.all(9.0),
                child: Text('Sterea for Pets'))
          ],
        ),
        navBarItems: [
          NavBarItem(
            text: "Home",
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          NavBarItem(
            text: "About Us",
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
      body: MapBox(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2BD4DA),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: const Text("Προσθήκη νέου"),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey,
                          child: Icon(Icons.image),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Όνομα",
                            icon: Icon(Icons.account_box),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Περιγραφή",
                            icon: Icon(Icons.email),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Χαρακτηριστικά",
                            icon: Icon(Icons.message),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Τηλέφωνο",
                            icon: Icon(Icons.phone_callback),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text("Προσθήκη"),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Animal',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
