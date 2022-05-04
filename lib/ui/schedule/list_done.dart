import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListDonePage extends StatelessWidget {
  ListDonePage({Key? key}) : super(key: key);
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('jadwal').orderByChild('status').equalTo(true);
    return Scaffold(
      body: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            return InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(snapshot.child('nama').value.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(snapshot.child('alamat').value.toString()),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/ex.jpg"),
                      ),
                      trailing: new Column(
                        children: <Widget>[
                          new Container(
                            child: new IconButton(
                              icon: new Icon(Icons.chat_outlined, color: Colors.green),
                              onPressed: () {
                                launchWhatsApp(phone: int.parse(snapshot.child('telp').value.toString()));
                                var key = snapshot.key;
                                DatabaseReference del = FirebaseDatabase.instance.ref("jadwal/$key");
                                del.remove();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

void launchWhatsApp({required int phone}) async {
  String url() {
    return "whatsapp://send?phone="+phone.toString()+"&text=Sampah Anda sudah diambil";
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}