import 'package:example1/adddata.dart';
import 'package:example1/allcontacts.dart';
import 'package:example1/listbyprovince.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("รายชื่อ"),
          bottom: const TabBar(isScrollable: true, tabs: [
            Tab(text: "รายชื่อทั้งหมด"),
            Tab(text: "รายชื่อแยกตามแต่ละจังหวัด ")
          ]),
        ),
        body: const TabBarView(children: [
          AllContacts(),
          AddressID(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext context) => const Adddata()))
                .then((value) {
              setState(() {});
            });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes aut
      ),
    );
  }
}
