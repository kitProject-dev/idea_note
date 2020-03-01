import 'package:flutter/material.dart';
import 'package:idea_note/model/edit_note_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:idea_note/widget/edit_note/edit_note_action_button.dart';
import 'package:idea_note/widget/edit_note/edit_note_app_bar.dart';
import 'package:idea_note/widget/edit_note/edit_note_body.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen(this._index);

  final int _index;

  @override
  Widget build(BuildContext context) {
    final noteRepository = Provider.of<NoteRepository>(context);
    final settingsModel = Provider.of<SettingsModel>(context);
    final editNoteModel = EditNoteModel(noteRepository, settingsModel);
    return FutureBuilder<bool>(
      initialData: false,
      future: editNoteModel.load(_index),
      builder: (context, snapshot) {
        return !snapshot.data
            ? Container()
            : MultiProvider(
                providers: [
                  ChangeNotifierProvider<EditNoteModel>.value(
                    value: editNoteModel,
                  ),
                ],
                child: Scaffold(
                  appBar: EditNoteAppBar(),
                  body: EditNoteBody(),
                  floatingActionButton: EditNoteActionButton(),
                ),
              );
      },
    );
  }
}
