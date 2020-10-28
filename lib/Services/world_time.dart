import 'package:http/http.dart';
import'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;//location name for the UI
  String Time;//the time in that location
  String flag;//url to an asset flag icon
  String url;//this the location of url for the api location
  bool isDayTime;// true or false if daytime is true or false

  WorldTime({this.location,this.flag,this.url});

  Future <void> getTime() async {

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data= jsonDecode(response.body);

      //get properties fropm data

      String datetime = data['datetime'];
      String offset =data['utc_offset'].substring(1,3);


      //datetime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
     Time = DateFormat.jm().format(now);

    }
    catch(e){
      print('Time zone doent exist :e');
      Time = 'COULD NO GET TIME DATA';
    }


  }

}

