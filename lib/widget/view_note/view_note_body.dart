import 'package:flutter/material.dart';
import 'package:idea_note/model/view_note_model.dart';
import 'package:provider/provider.dart';

class ViewNoteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final viewNoteModel = Provider.of<ViewNoteModel>(context);
    return Container(
      color: themeData.cardColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              viewNoteModel.note.content,
              style: themeData.textTheme.body1,
            ),
          ),
        ),
      ),
    );
  }
}
