import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quick_notes/models/note.dart';
import 'package:quick_notes/services/note_service.dart';

class NoteProvider extends ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  final NoteService noteService = NoteService();
   List<NoteModel> noteList = [
  ];
  void deleteNote(String noteId){
    noteList.removeWhere((note)=> note.noteID == noteId);
    notifyListeners();
  }
  Future<void> addNote(NoteModel note)async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try{
      NoteModel currNote = await noteService.createNote(note);
      noteList.add(currNote);
    }catch(e){
      errorMessage = "Failed to add note";
    }
    finally{
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> getNotes() async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final notes = await noteService.getNotes();
      noteList = notes;
    } catch (e) {
      errorMessage = "Failed to load notes";
    }
    finally{
      isLoading = false;
      notifyListeners();
    }

    isLoading = false;
    notifyListeners();
  }
}