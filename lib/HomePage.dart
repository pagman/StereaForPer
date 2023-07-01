import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveNavBar(
        screenWidth: MediaQuery.of(context).size.width,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Sterea for Pets'))
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
          NavBarItem(
            text: "About Us",
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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>{},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
