import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/model/note_model.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:provider/provider.dart';

class NoteViewScreen extends StatefulWidget {
  const NoteViewScreen(this._index);

  final int _index;

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final noteModel = NoteModel(storage);
    return FutureBuilder<bool>(
      initialData: false,
      future: noteModel.load(widget._index),
      builder: (context, snapshot) {
        return !snapshot.data
            ? Container()
            : WillPopScope(
                onWillPop: () async {
                  Navigator.of(context).pop(noteModel.note);
                  return false;
                },
                child: Scaffold(
                  appBar: AppBar(
                    title: SelectableText(noteModel.note.title),
                  ),
                  body: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: SelectableText(noteModel.note.content),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
