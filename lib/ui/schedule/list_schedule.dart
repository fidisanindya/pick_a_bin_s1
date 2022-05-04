import 'package:boilerplate/models/UserJadwal.dart';
import 'package:boilerplate/models/schedule/list_schedule.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ref = FirebaseDatabase.instance.ref().child('jadwal').orderByChild('status').equalTo(false);
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              bool isChecked = snapshot.child('status').value as bool;
              return InkWell(
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      title: Text(
                        snapshot.child('nama').value.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(snapshot.child('alamat').value.toString()),
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          var key = snapshot.key;
                          DatabaseReference up = FirebaseDatabase.instance.ref("jadwal/$key");
                          up.update({
                            "status": true,
                          });
                        });
                      },
                    ),
                  ],
                ),
              );
            }
        ),
      )
    );
  }
}