import 'package:flutter/material.dart';
import 'package:quick_notes/models/note.dart';

class NoteCard extends StatelessWidget {
  final NoteModel noteModel;

  const NoteCard({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      noteModel.noteTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  PopupMenuButton<String>(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    color: colors.primary,
                    onSelected: (value) {
                      if (value == "edit_note") {
                        // Edit note
                      } else if (value == "delete_note") {
                        // Delete note
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'edit_note',
                        child: Row(
                          children: [
                            const Icon(
                              Icons.edit_outlined,
                              color: Color(0xFFF8FAFC),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Edit Note',
                              style: textTheme.bodyLarge?.copyWith(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(
                        height: 1,
                        color: Colors.white12,
                        indent: 10,
                        endIndent: 10,
                      ),
                      PopupMenuItem(
                        value: 'delete_note',
                        child: Row(
                          children: [
                            Icon(Icons.delete_outlined, color: colors.error),
                            const SizedBox(width: 5),
                            Text(
                              'Delete Note',
                              style: textTheme.bodyLarge?.copyWith(
                                color: colors.error,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 4),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.white12),
                ),
                child: Text(
                  noteModel.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 6),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${noteModel.createdAt.year}/"
                  "${noteModel.createdAt.month}/"
                  "${noteModel.createdAt.day}",
                  style: textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
