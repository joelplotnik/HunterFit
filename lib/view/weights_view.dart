import 'package:flutter/material.dart';
//import 'package:hunter_fit/view/weightlifting.dart';
import 'package:hunter_fit/widgets/countdown_timer.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  List<Widget> _setsList = [];

  Widget _setCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
      child: SizedBox(
        height: 80,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.grey,
                width: 1,
              )),
          color: Colors.grey.shade300,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "0",
                      counterText: "",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(40, 25, 10, 10)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  "X",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "0",
                    counterText: "",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(15, 24, 40, 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SizedBox(width: 1),
              Text("Sets"),
              SizedBox(width: 30),
              Text("Reps"),
              SizedBox(width: 50),
              Text("Weight"),
              SizedBox(width: 30),
              Text("1RM"),
              SizedBox(width: 1),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _setsList.length,
            itemBuilder: (context, index) {
              return _setsList[index];
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          setState(() {
            _setsList.add(_setCard());
          });
        },
      ),
    );
  }
}
