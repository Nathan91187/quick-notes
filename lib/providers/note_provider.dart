import 'package:flutter/cupertino.dart';
import 'package:quick_notes/models/note.dart';
import 'package:quick_notes/services/note_service.dart';

class NoteProvider extends ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  String? deletingNoteId;
  final NoteService noteService = NoteService();
   List<NoteModel> noteList = [

  ];
  Future<void> editNote(String noteID, Map<String , dynamic> updates)async{
    try{
      final note = await noteService.editNote(noteID, updates);
      final index = noteList.indexWhere((currNote)=> currNote.noteID == noteID);
      if(index == -1){
        throw Exception("note not found");
      }
      noteList[index] = note;
      notifyListeners();
    }
    catch(e){
      throw Exception("Couldn't edit note");
    }
  }
  Future<void> deleteNote(String noteID) async{
    deletingNoteId = noteID;
    notifyListeners();
      try {
        await noteService.deleteNote(noteID);
        noteList.removeWhere((note)=> note.noteID == noteID);
      } finally {
        deletingNoteId = null;
        notifyListeners();
      }
  }
  Future<void> addNote(NoteModel note)async{
      NoteModel currNote = await noteService.createNote(note);
      noteList.add(currNote);
      notifyListeners();
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

  }
}