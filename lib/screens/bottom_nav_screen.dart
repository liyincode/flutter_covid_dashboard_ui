import 'package:flutter/material.dart';

import 'package:flutter_covid_dashboard_ui/screens/home_screen.dart';
import 'package:flutter_covid_dashboard_ui/screens/stats_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    StatsScreen(),
    Scaffold(),
    Scaffold()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (currentIndex) {
                setState(() {
                  _currentIndex = currentIndex;
                });
              },
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0.0,
              items:
                  [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
                      .asMap()
                      .map((key, value) => MapEntry(
                            key,
                            BottomNavigationBarItem(
                                title: Text(''),
                                icon: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 16.0),
                                  child: Icon(value),
                                  decoration: BoxDecoration(
                                    color: _currentIndex == key
                                        ? Colors.blue[600]
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                )),
                          ))
                      .values
                      .toList()),
          body: screens[_currentIndex],
        ),
      ),
    );
  }
}
