import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';

class FlightsScreen extends StatelessWidget {
  const FlightsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var flightBloc = Provider.of<FlightBloc>(context);

    return Container(
      child: StreamBuilder(
        stream: flightBloc.flights,
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var flight = snapshot.data[index] as FlightModel;
                  return Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.airplanemode_active),
                            title: Text(
                                '${flight.origin.iataCode} - ${flight.destination.detailedName}'),
                            subtitle: Text(
                                'Depart: ${DateFormat.yMMMd().format(flight.departureDate)} - Return: ${DateFormat.yMMMd().format(flight.returnDate)}'),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              Text(
                                  'TOTAL: \$${flight.price.toStringAsFixed(2)}'),
                              FlatButton(
                                child: const Text('Book'),
                                onPressed: () {/* ... */},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Container(),
      ),
    );
  }
}
