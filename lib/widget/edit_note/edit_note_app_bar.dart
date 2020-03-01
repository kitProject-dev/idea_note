import 'package:flutter/material.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/edit_note_model.dart';
import 'package:provider/provider.dart';

class EditNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  EditNoteAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Selector<EditNoteModel, Note>(
              selector: (context, model) => model.note,
              builder: (context, note, child) => SelectableText(note.title),
            ),
          ),
          Selector<EditNoteModel, String>(
            selector: (context, model) => model.timeStr,
            builder: (context, count, child) => Text(
              count.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
