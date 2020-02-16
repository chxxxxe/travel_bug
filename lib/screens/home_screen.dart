import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';
import 'package:travel_bug/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeBloc = Provider.of<HomeBloc>(context);
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          title: Text(homeBloc.title),
          backgroundColor: Colors.orangeAccent,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              SizedBox(child: Tab(text: 'Profile')),
              Tab(text: 'Photos'),
              Tab(text: 'Buddies'),
              Tab(text: 'Map'),
              Tab(text: 'Flights'),
              Tab(text: 'Hotels'),
              Tab(text: 'Cars'),
              Tab(text: 'Restaurants'),
            ],
          ),
        ),
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          children: [
            Container(
              child: Text('Profile'),
            ),
            Container(
              child: Text('Photos'),
            ),
            Container(
              child: Text('Buddies'),
            ),
            Container(
              child: Text('Map'),
            ),
            ChangeNotifierProvider(
              create: (_) => FlightBloc(),
              child: FlightsScreen(),
            ),
            ChangeNotifierProvider(
              create: (_) => HotelsBloc(),
              child: HotelsScreen(),
            ),
            Container(
              child: Text('Cars'),
            ),
            Container(
              child: Text('Restaurants'),
            ),
          ],
        ),
      ),
    );
  }
}

//S7OIei9kDYqSYbcX1ByW3ZXZLSPGeGbL
//DEAh7NF90GcAenFv
