import 'dart:convert';

import 'package:quick_notes/models/note.dart';
import 'package:http/http.dart';
class NoteService {
  Future<void> deleteNote(String noteID) async{
    final response = await delete(
        Uri.parse("https://dummyjson.com/posts/$noteID"));
    if(response.statusCode < 200 || response.statusCode >= 300){
      throw Exception("Failed to delete note");
    }
  }
  Future<List<NoteModel>> getNotes() async{
    final response = await get(
      Uri.parse("https://dummyjson.com/posts")
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<dynamic> posts = data['posts'];
     return posts.map((post)=> NoteModel.fromJson(post)).toList();
    }
    else{
     throw Exception("failed to load notes");
    }
  }
  Future<NoteModel> createNote(NoteModel note) async{
      final response = await post(
          Uri.parse("https://dummyjson.com/posts/add"),
          body: jsonEncode({
            ...note.toJson(),
                'userId': 1,
          }
          ),
          headers: {
            'content-type' : 'application/json',
          }
      );
      if(response.statusCode < 200 || response.statusCode >= 300){
        throw Exception("Failed to create note");
      }
      final json = jsonDecode(response.body);
      return NoteModel.fromJson(json);

  }
  Future<NoteModel> editNote(String noteID, Map<String,dynamic> updates) async{
    final response = await patch(
      Uri.parse("https://dummyjson.com/posts/$noteID"),
      body: jsonEncode(updates),
      headers: {
        'content-type' : 'application/json'
      }
    );
    if(response.statusCode < 200 || response.statusCode >= 300){
      throw Exception("Failed to update note");
    }
    final json = jsonDecode(response.body);
    return NoteModel.fromJson(json);
  }
}