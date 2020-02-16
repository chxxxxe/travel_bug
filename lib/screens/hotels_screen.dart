import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var flightBloc = Provider.of<HotelsBloc>(context);

    return Container(
      child: StreamBuilder(
        stream: flightBloc.hotels,
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var hotel = snapshot.data[index] as Hotel;
                  return Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.hotel),
                            title: Text(
                                '${hotel.name} ${hotel.rating} Stars - ${hotel.offers[0].price.total.toStringAsFixed(2)}${hotel.offers[0].price.currency}'),
                            subtitle:
                                Text('${hotel.offers[0].room.description}'),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              // Text(
                              //     'TOTAL: \$${hotel.price.toStringAsFixed(2)}'),
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
