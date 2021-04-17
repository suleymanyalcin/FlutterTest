import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(children: [
      Expanded(child: ListView.builder(
          itemCount: students.length,
          itemBuilder: itemBuilder))
    ]);
  }

  List<Student> students = [
    Student.withId(1, "Süleyman", "yalçın", 95),
    Student.withId(2, "özgün", "yalçın", 55),
    Student.withId(2, "kerem", "yalçın", 25),
  ];

  Widget itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text(students[index].firstName+" "+ students[index].lastName),
      subtitle:Text("Sınavdan Alığı Not: "+ students[index].grade.toString()),
     leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pinimg.com/564x/04/bb/21/04bb2164bbfa3684118a442c17d086bf.jpg"),),
    trailing: Icon(Icons.done),);
  }
}
