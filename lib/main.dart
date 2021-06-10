import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//My imports
import 'package:band_names_app/pages/status.dart';
import 'package:band_names_app/services/socket_service.dart';
import 'package:band_names_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'status': (_) => StatusPage()},
      ),
    );
  }
}
