import 'package:flutter/material.dart';
import 'package:hunter_fit/model/database/insertUserData.dart';
import 'package:hunter_fit/view/weights/components/set_card.dart';
import 'package:hunter_fit/constants.dart' as constants;
import 'package:hunter_fit/view/widgets/weights_stopwatch.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

int setNumber = 1;
int controllerNumber = 0;

List<TextEditingController> repsControllerList = [TextEditingController()];
List<TextEditingController> lbsControllerList = [TextEditingController()];

TextEditingController lbsController = TextEditingController();
TextEditingController repsController = TextEditingController();
String lbs = lbsController.text;

bool tf = true;

Widget createSetCard() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            setNumber.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: const BoxDecoration(color: constants.kHunterColor),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextField(
          controller: repsControllerList[controllerNumber],
          textAlign: TextAlign.center,
          maxLength: 3,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            hintText: "reps",
            // suffix: Text('reps'),
            counterText: "",
            border: InputBorder.none,
          ),
        ),
      ),
      const Expanded(
        child: Center(child: Text("x")),
      ),
      Expanded(
        flex: 3,
        child: TextField(
          controller: lbsController,
          textAlign: TextAlign.center,
          maxLength: 3,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            hintText: "lbs",
            suffix: Text("lbs"),
            counterText: "",
            border: InputBorder.none,
            //suffix: Text('lbs'),
          ),
        ),
      ),
    ],
  );
}

insertToDB() async {
  insertUserData insertData = insertUserData();
  await insertData.insertWeightRepAndLbs();
}

class _WeightsViewState extends State<WeightsView> {
  WeightsStopwatch stopwatch = WeightsStopwatch();
  TextEditingController workoutName = TextEditingController();
  final List<Widget> _setsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Container(
            height: 55,
            color: constants.kHunterColor,
            alignment: const Alignment(-.9, -.1),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: workoutName,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter a workout name...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.transparent,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      if (workoutName.text.isNotEmpty && _setsList.isEmpty) {
                        setState(() {
                          _setsList.add(createSetCard());
                          setNumber++;
                        });
                      } else if (workoutName.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarWorkoutName);
                        // } else if (card.lbs.text.isEmpty ||
                        //     card.reps.text.isEmpty) {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(snackBarRepsLbs);
                      } else {
                        openDialog();
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _setsList.length,
              itemBuilder: (context, index) {
                return _setsList[index];
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.black38,
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 2,
            thickness: 1,
          ),
          Container(
            color: Colors.grey.shade300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: stopwatch,
          )
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) {
          //If workoutName is not empty and the setsLists is not empty
          if (!workoutName.text.isEmpty && _setsList.isNotEmpty) {
            return AlertDialog(
              title: Text('Log Previous Set?'),
              actions: [
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text('YES'),
                  onPressed: () => setState(() {
                    _setsList.add(createSetCard());
                    setNumber++;
                    repsControllerList.add(repsController);
                    lbsControllerList.add(lbsController);
                    print(repsControllerList[controllerNumber - 9].text);
                    controllerNumber++;
                    Navigator.pop(context);
                  }),
                )
              ],
            );
          } else {
            return AlertDialog(
              title: Text('ERROR'),
              actions: [
                TextButton(
                  child: Text('Close'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          }
        },
      );

  final snackBarWorkoutName = SnackBar(
    content: const Text('Please enter a workout name...'),
    backgroundColor: Colors.red.shade400,
    duration: Duration(seconds: 2),
  );

  final snackBarRepsLbs = SnackBar(
    content: const Text('Please fill in both sets and reps...'),
  );
}
