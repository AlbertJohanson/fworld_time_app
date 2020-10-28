import 'package:flutter/material.dart';
import 'package:fworld_time_app/Services/world_time.dart';
import 'package:fworld_time_app/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  __ChooseLocationState createState() => __ChooseLocationState();
}

class __ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'America/Guatemala', location: 'Guatemala City', flag: 'Guatemala.png'),
    WorldTime(url:'Asia/Tokyo', location: 'Tokio', flag: 'Japan.png'),
    WorldTime(url:'Europe/Rome', location: 'Roma', flag: 'Italia.png'),
    WorldTime(url:'Asia/Seoul', location: 'Seol', flag: 'Korean.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations [index];
    await instance.getTime();

    //navigate to home screen

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.Time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0 ),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                    (locations[index].location)
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      )
    );
  }
}

