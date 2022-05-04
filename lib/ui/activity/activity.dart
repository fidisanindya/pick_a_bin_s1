import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Aktivitas',
          style: TextStyle(color: Color(0xff00783E)),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 100,

      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListItem(
            title: Text("Anda belum mengambil sampah hari ini"),
          );
        },
        itemCount: 4,
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required Text title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                "Anda belum mengambil sampah",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Aradhana Luqman\nSurya Citra Residence G-21 Tropodo"),
              trailing: Text("25/04/22",
                style: TextStyle(color: Colors.grey)),
            ),
          ),
          Divider(color: Colors.black)
        ],
      );
  }
}