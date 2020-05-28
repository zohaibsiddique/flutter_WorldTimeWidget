import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterapp/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setWorldTime() async{
    //WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'uk.png'),
    WorldTime instance = WorldTime(location: 'Karachi', flag: 'germany.png', url: 'Asia/Karachi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time':instance.time,
      'location':instance.location,
      'flag':instance.flag,
      'isDaytime':instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
