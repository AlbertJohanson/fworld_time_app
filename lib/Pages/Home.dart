import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgcolor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image : AssetImage('images/$bgImage'),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context,'/location');
                  setState(() {
                    data = {
                      'time':result['time'],
                      'location':result['location'],
                      'isDayTime':result['isDayTime'],
                      'flag':result['flag']
                    };
                  });
                },
                icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300] ,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300]
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                        color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 29.0
                    ),
                  )
                ],
              ),
              SizedBox(height:20.0),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 66.0
                )
              )
            ],
          ),
        )
      )
    );
  }
}