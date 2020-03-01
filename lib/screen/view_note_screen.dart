import 'package:flutter/material.dart';
import 'package:idea_note/model/view_note_model.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:idea_note/widget/my_app_bar.dart';
import 'package:idea_note/widget/view_note/view_note_body.dart';
import 'package:provider/provider.dart';

class ViewNoteScreen extends StatefulWidget {
  const ViewNoteScreen(this._index);

  final int _index;

  @override
  _ViewNoteScreenState createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final viewNoteModel = ViewNoteModel(Provider.of<NoteRepository>(context));
    return FutureBuilder<bool>(
      initialData: false,
      future: viewNoteModel.load(widget._index),
      builder: (context, snapshot) {
        return !snapshot.data
            ? Container()
            : MultiProvider(
                providers: [
                  Provider<ViewNoteModel>.value(
                    value: viewNoteModel,
                  ),
                ],
                child: WillPopScope(
                  onWillPop: () async {
                    Navigator.of(context).pop(viewNoteModel.note);
                    return false;
                  },
                  child: Scaffold(
                    appBar: MyAppBar(viewNoteModel.note.title),
                    body: ViewNoteBody(),
                  ),
                ),
              );
      },
    );
  }
}
