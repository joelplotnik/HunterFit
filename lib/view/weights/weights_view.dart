import 'package:flutter/material.dart';
import 'package:hunter_fit/view/weights/components/set_card.dart';
import 'package:hunter_fit/constants.dart' as constants;
import 'workouts_list.dart';
import 'package:hunter_fit/view/widgets/weights_stopwatch.dart';

class WeightsView extends StatefulWidget {
  const WeightsView({Key? key}) : super(key: key);

  @override
  State<WeightsView> createState() => _WeightsViewState();
}

class _WeightsViewState extends State<WeightsView> {
  WeightsStopwatch stopwatch = WeightsStopwatch();
  TextEditingController workoutName = TextEditingController();

  final List<Widget> _setsList = [];
  int setNumber = 1;
  late SetCard card = SetCard(setNumber);
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
                          SetCard card = SetCard(setNumber);
                          _setsList.add(card.createSetCard());
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
                    card = SetCard(setNumber);
                    _setsList.add(card.createSetCard());
                    setNumber++;
                    Navigator.pop(context);
                  }),
                )
              ],
            );
            //Else if the workoutName is empty
          } //else if (workoutName.text.isEmpty) {
          //   // return AlertDialog(
          //   //   title: Text('Enter a workout name...'),
          //   //   actions: [
          //   //     TextButton(
          //   //       child: Text('Close'),
          //   //       onPressed: () => Navigator.pop(context),
          //   //     )
          //   //   ],
          //   // );
          // }
          //else,
          else {
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
