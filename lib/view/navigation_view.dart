import 'package:flutter/material.dart';
import 'package:hunter_fit/api/google_maps_page.dart';
import 'package:hunter_fit/view/profile_view.dart';
import 'package:hunter_fit/view/weights/weights_view.dart';
import 'package:hunter_fit/view/activity_view.dart';
import 'package:hunter_fit/view/groups_view.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedPage = 0; // Value of the selected page
  late String _title;
  PageController pageController = PageController();

  @override
  void initState() {
    _title = 'Activity';
    super.initState();
  }

  void onTapped(int page) {
    setState(() {
      _selectedPage = page;

      switch (page) {
        case 0:
          {
            _title = 'Activity';
          }
          break;
        case 1:
          {
            _title = 'Cardio';
          }
          break;
        case 2:
          {
            _title = 'Groups';
          }
          break;
        case 3:
          {
            _title = 'Weightlifting';
          }
          break;
        case 4:
          {
            _title = 'Profile';
          }
          break;
      }
    });

    pageController.jumpToPage(page);

    // To add animations
    /*
     pageController.animateToPage(page,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
     */
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(_title)),
            backgroundColor: const Color(0xFF47ABD1),
            automaticallyImplyLeading: false,
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              ActivityView(),
              const GoogleMapPage(),
              const GroupsView(),
              const WeightsView(),
              const ProfileView(),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xFF47ABD1),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_activity,
                  ),
                  label: 'Activity',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.directions_run,
                    ),
                    label: 'Cardio'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.group,
                    ),
                    label: 'Groups'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.fitness_center,
                    ),
                    label: 'Weightlifting'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: 'Profile')
              ],
              currentIndex: _selectedPage,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              onTap: onTapped,
            ),
          )),
    );
  }
}
