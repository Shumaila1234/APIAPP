import 'dart:convert';
import 'dart:io';

import 'package:api_app/models/api_response.dart';
import 'package:api_app/models/note.dart';
import 'package:api_app/models/note_for_listing.dart';
import 'package:api_app/models/note_insert.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': 'ab663487-af79-48b4-9a3f-9c16b129d7af',
  'Content-Type':'application/json'};

  Future<APIResponse<List<NoteforListing>>> getNotesList() {
    return http.get(Uri.parse(API+'/notes'), headers: headers).then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteforListing>[];
        for (var item in jsonData) {
          notes.add(NoteforListing.fromJson(item));
        }
        return APIResponse<List<NoteforListing>>(data: notes);
      }
      return APIResponse<List<NoteforListing>>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<List<NoteforListing>>(error: true, errorMessage: 'An error occured'));
  }


Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(Uri.parse(API+'/notes/'+ noteID), headers: headers).then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<Note>(error: true, errorMessage: 'An error occured'));
  }



Future<APIResponse<bool>> createNote(NoteManipulation item) {
    return http.post(Uri.parse(API+'/notes'), headers: headers,body: json.encode(item.toJson())).then((data) {
      print(data.statusCode);
      if (data.statusCode == 201) {   //201 code is for post 
        return APIResponse<bool>(data:true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }



Future<APIResponse<bool>> updateNote(String noteID,NoteManipulation item) {
    return http.put(Uri.parse(API+'/notes/'+noteID), headers: headers,body: json.encode(item.toJson())).then((data) {
      print(data.statusCode);
      if (data.statusCode == 204) {   //204 code is for true response, update 
        return APIResponse<bool>(data:true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }



Future<APIResponse<bool>> deleteNote(String noteID) {
    return http.delete(Uri.parse(API+'/notes/'+noteID), headers: headers).then((data) {
      print(data.statusCode);
      if (data.statusCode == 204) {   //204 code is for true response, update 
        return APIResponse<bool>(data:true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}