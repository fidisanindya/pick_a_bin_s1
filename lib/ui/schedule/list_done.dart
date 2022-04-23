import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListDonePage extends StatelessWidget {
  ListDonePage({Key? key}) : super(key: key);
  var faker = new Faker();

  void launchWhatsApp({required int phone}) async {
    String url() {
      return "https://wa.me/$phone";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'List Done',
            style: TextStyle(color: Color(0xff00783E)),
          ),
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff00783E),
            ),
            label: const Text(
              'Back',
              style: TextStyle(color: Color(0xff00783E)),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0, primary: Colors.transparent),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListItem(
              title: faker.person.name(),
            );
          },
          itemCount: 15,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color(0xffcbd4cd).withOpacity(0.8), spreadRadius: 6,
                            blurRadius: 7,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                          color: Colors.green,
                          margin: const EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
                          child: InkWell(
                            onTap: () {
                              launchWhatsApp(phone: 6289521441520 );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text(
                                  "Confirm to WhatsApp",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ]),
        ));
  }
}

class ListItem extends StatelessWidget {
  final String title;

  ListItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Surabaya, Jawa Timur, Indonesia"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ex.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}