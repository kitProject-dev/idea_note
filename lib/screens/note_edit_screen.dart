import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/note_model.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:idea_note/widgets/note_edit_body.dart';
import 'package:provider/provider.dart';

class NoteEditScreen extends StatelessWidget {
  const NoteEditScreen(this._index);

  final int _index;

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final noteModel = NoteModel(storage);
    return FutureBuilder<Note>(
      initialData: null,
      future: noteModel.load(_index),
      builder: (context, snapshot) {
        final note = snapshot.data;
        return note == null
            ? Container()
            : MultiProvider(
                providers: [
                  Provider.value(
                    value: note,
                  ),
                ],
                child: Builder(
                  builder: (context) {
                    final note = Provider.of<Note>(context);
                    return Scaffold(
                      appBar: AppBar(
                        title: SelectableText(note.title),
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop(note);
                              },
                              child: Icon(FontAwesomeIcons.save),
                            ),
                          ),
                        ],
                      ),
                      body: const NoteEditBody(),
                    );
                  },
                ),
              );
      },
    );
  }
}
