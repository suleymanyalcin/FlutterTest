import 'package:flutter/material.dart';

class Student{
  int id;
  String firstName;
   String lastName;
  int grade;
  String _status;

  Student(String firstName,String lastName,int grade){
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
  }
  Student.withId(int id,String firstName,String lastName,int grade){
    this.id=id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;
  }
  String get status{
    String message="";
    if(this.grade>=50){
      message="Geçti";
    }else if(this.grade>40){
      message="Bütünlemeye kaldı";
    }else
      {
        message="Kaldı";
      }
    return message;
  }
  IconData GetStatatusIcon(){
    if(this.grade>50)
      {
        return Icons.done;
      }else if(this.grade>40){
      return Icons.album;
    }else
      {
        return Icons.clear;
      }
  }
}