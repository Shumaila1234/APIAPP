import 'package:api_app/services/Notes_service.dart';
import 'package:api_app/views/Notelist.dart';
import 'package:api_app/views/Notesmodify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


void setupLocator(){
  GetIt.I.registerLazySingleton(() => NotesService());  //I is short of  instance 
}

void main(){
  setupLocator();
  runApp(Home());
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     routes: {
        "/Notesmodify": (context) => NoteModify(),
      },
      home: NoteList(),
      
    );
  }
}