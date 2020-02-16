import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
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
              FlightsScreen(),
              Container(
                child: Text('Hotels'),
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
      ),
    );
  }
}

class FlightsScreen extends StatelessWidget {
  const FlightsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeBloc = Provider.of<MainBloc>(context);
    homeBloc.currentBloc = FlightBloc();
    var flightBloc = homeBloc.currentBloc as FlightBloc;

    return Container(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container(child: Text(flightBloc.flights['data'][index]));
      }),
    );
  }
}

//S7OIei9kDYqSYbcX1ByW3ZXZLSPGeGbL
//DEAh7NF90GcAenFv
