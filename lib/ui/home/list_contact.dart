import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ListContactPage extends StatelessWidget {
  ListContactPage({Key? key}) : super(key: key);
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'List Contact',
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
    );
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
            subtitle: Text("+62 "),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ex.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}