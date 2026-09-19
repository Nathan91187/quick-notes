

class NoteModel {
  String noteID;
  String noteTitle;
  String content;
  NoteModel({
    required this.content,
    required this.noteID,
  required this.noteTitle,
});
  factory NoteModel.fromJson(Map<String, dynamic> json){
    return NoteModel(
        content: json['body'],
        noteID: json['id'].toString(),
        noteTitle: json['title']);
  }
  Map<String, dynamic> toJson (){
    return {
      'title' : noteTitle,
      'body' : content
    };
  }
}