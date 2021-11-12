import 'package:flutter/material.dart';
class Cardio_View extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 102, 146, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(73, 172, 207, 1),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: ("Cardio"),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: <Widget>[
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            splashColor: Colors.greenAccent,
            elevation: 8.0,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Upper Legs.png'),
                    fit: BoxFit.contain),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("HIIT",
                  textAlign: TextAlign.center,
                ),

              ),
            ),
            // ),
            onPressed: () {
              print('Tapped');
            },
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            splashColor: Colors.greenAccent,
            elevation: 8.0,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Upper Legs.png'),
                    fit: BoxFit.contain),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("HIIT",
                  textAlign: TextAlign.center,
                ),

              ),
            ),
            // ),
            onPressed: () {
              print('Tapped');
            },
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            splashColor: Colors.greenAccent,
            elevation: 8.0,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Upper Legs.png'),
                    fit: BoxFit.contain),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("HIIT",
                  textAlign: TextAlign.center,
                ),

              ),
            ),
            // ),
            onPressed: () {
              print('Tapped');
            },
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            splashColor: Colors.greenAccent,
            elevation: 8.0,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Upper Legs.png'),
                    fit: BoxFit.contain),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("HIIT",
                  textAlign: TextAlign.center,
                ),

              ),
            ),
            // ),
            onPressed: () {
              print('Tapped');
            },
          ),
        ],
      )
    ); 
  }
}