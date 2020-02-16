import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
              tabs: [
              Tab(text: 'Profile'),
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

                ),


            ],
          ),
        ),
      ),
    );
  }
}


//S7OIei9kDYqSYbcX1ByW3ZXZLSPGeGbL
//DEAh7NF90GcAenFv