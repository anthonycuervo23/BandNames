import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:band_names_app/services/socket_service.dart';

//THIS PAGE IS ONLY FOR TESTING

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ServerStatus ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message_rounded),
          onPressed: () {
            socketService.emit('nuevo-mensaje',
                {'nombre': 'Flutter', 'mensaje': 'Hello from Flutter.!'});
          }),
    );
  }
}
