import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'pk.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'uk.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'uk.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'uk.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'uk.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'uk.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'uk.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'uk.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    print(instance.time+", "+instance.location);

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        title: Text('Choose location'),
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
