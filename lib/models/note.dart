class NoteModel {
  String noteID;
  String noteTitle;
  String content;
  DateTime createdAt;
  NoteModel({
    required this.createdAt,
    required this.content,
    required this.noteID,
  required this.noteTitle,
});
}