import 'dart:convert';

import 'package:quick_notes/models/note.dart';
import 'package:http/http.dart';
class NoteService {
  Future<List<NoteModel>> getNotes() async{
    final response = await get(
      Uri.parse("https://dummyjson.com/posts")
    );
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
     return data['posts'].map(NoteModel.fromJson).toList();
    }
    else{
     throw Exception("failed to load members");
    }
  }
  Future<NoteModel> createNote(NoteModel note) async{
      final response = await post(
          Uri.parse("https://dummyjson.com/posts/add"),
          body: jsonEncode({
            ...note.toJson(),
                'userId': 1,}
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
}