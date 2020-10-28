import 'package:flutter/material.dart';
import 'package:fworld_time_app/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldtime () async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'german.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/Home', arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.Time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  void initState() {
    super.initState();
    setUpWorldtime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRing(
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
