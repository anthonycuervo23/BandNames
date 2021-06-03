import 'dart:io';

import 'package:band_names_app/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Califa', votes: 5),
    Band(id: '2', name: 'Coquito', votes: 5),
    Band(id: '3', name: 'Mami', votes: 5),
    Band(id: '4', name: 'Papi', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Band Names', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return bandTile(bands[index]);
        },
        itemCount: bands.length,
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 1, child: Icon(Icons.add), onPressed: addNewBand),
    );
  }

  Widget bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) {
        print('${band.id} eliminado');
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Delete Band',
              style: TextStyle(color: Colors.white),
            )),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final TextEditingController textController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('New band name: '),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                  child: Text('Add'),
                  textColor: Colors.blue,
                  elevation: 5,
                  onPressed: () {
                    addBandToList(textController.text);
                  })
            ],
          );
        },
      );
    }
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('New band name: '),
            content: TextField(
              controller: textController,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Add'),
                onPressed: () {
                  addBandToList(textController.text);
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Dismiss'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void addBandToList(String bandName) {
    if (bandName.length > 1) {
      this.bands.add(
          Band(id: DateTime.now().day.toString(), name: bandName, votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
