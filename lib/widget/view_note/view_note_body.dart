import 'package:flutter/material.dart';
import 'package:idea_note/model/view_note_model.dart';
import 'package:provider/provider.dart';

class ViewNoteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewNoteModel = Provider.of<ViewNoteModel>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: SelectableText(viewNoteModel.note.content),
        ),
      ),
    );
  }
}
