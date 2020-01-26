import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/bloc/note_bloc.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:idea_note/route.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final noteBloc = NoteBloc(storage);
    return MultiProvider(
      providers: [
        Provider<NoteBloc>(
            create: (_) => noteBloc,
            dispose: (context, value) => value.dispose()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: SelectableText(AppLocalizations.of(context).title),
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final note = await Navigator.of(context).pushNamed(
              RoutePath.editNote,
              arguments: -1,
            ) as Note;
            if (note == null) {
              return;
            }
            noteBloc.addNote.add(note);
          },
          child: Icon(FontAwesomeIcons.plus),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Builder(
      builder: (context) {
        final noteBloc = Provider.of<NoteBloc>(context);
        final themeData = Theme.of(context);
        return StreamBuilder(
          stream: noteBloc.notesStream,
          initialData: const <String>[],
          builder: (context, snapShot) {
            final noteList = snapShot.data as List<String>;
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        noteList[index],
                        style: TextStyle(
                          fontSize: themeData.textTheme.body1.fontSize,
                        ),
                      ),
                    ),
                    onTap: () async => await Navigator.of(context).pushNamed(
                      RoutePath.viewNote,
                      arguments: index,
                    ) as Note,
                    onLongPress: () => noteBloc.removeNote.add(index),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
