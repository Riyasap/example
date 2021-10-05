import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example"),),
      body: RaisedButton(
        child: Text("click", style: TextStyle(height: 1.0, letterSpacing: 1.0,),),
        onPressed: (){},
      ),

    );
  }
}
