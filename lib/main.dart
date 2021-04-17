import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/student.dart';
import 'package:flutter_app/screens/student_add.dart';

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
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }

}
class _HomeScreenState extends State {
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
          itemBuilder: itemBuilder)),
      Text("Seçili Öğrenci "+ selected.firstName),
      Row(
        children: [
          Flexible(fit: FlexFit.tight,flex: 2,
            child: MaterialButton(
              color: Colors.greenAccent,
            child: Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 5.0,),
                Text("Yeni Öğrenci")
              ],
            ),
              onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>StudentAdd(students)));
              },
            ),),
          Flexible(fit: FlexFit.tight,flex: 2,
            child: MaterialButton(
              color: Colors.blue,
              child: Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(width: 5.0,),
                  Text("Güncelle")
                ],
              ),
              onPressed: (){
                setState(() {

                });
              },
            ),),
          Flexible(fit: FlexFit.tight,flex: 1,
            child: MaterialButton(
              color:Color(0xFF801E48),
              child: Row(
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 5.0,),
                  Text("Sil")
                ],
              ),
              onPressed: (){setState(() {

              });},
            ),)
        ],
      )
    ]);
  }

  List<Student> students = [
    Student.withId(1, "Süleyman", "yalçın", 95),
    Student.withId(2, "özgün", "yalçın", 45),
    Student.withId(2, "kerem", "yalçın", 25),
  ];
Student selected= Student.withId(0,"", "", 0);
  Widget itemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text(students[index].firstName+" "+ students[index].lastName),
      subtitle:Text("Sınavdan Alığı Not: "+ students[index].grade.toString()+ " ["+students[index].status+"]"),
     leading: CircleAvatar(backgroundImage: NetworkImage("https://i.pinimg.com/564x/04/bb/21/04bb2164bbfa3684118a442c17d086bf.jpg"),),
    trailing: Icon(students[index].GetStatatusIcon()),onTap: (){

this.setState(() {
  this.selected=students[index];
});
    },onLongPress: (){
        print("uzun basıldı");
    },);
  }
}
