import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_notes/models/note.dart';
import 'package:quick_notes/providers/note_provider.dart';
import 'package:quick_notes/widgets/note_card.dart';
class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text("Your notes",),
      ),
      body: Consumer<NoteProvider>(
          builder: (context,noteProvider,child) =>
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5),
                child: ListView.builder(
                  itemCount: noteProvider.noteList.length,
                    itemBuilder: (context,index) => NoteCard(noteModel: noteProvider.noteList[index])),
              )
      )
    );
  }
}
