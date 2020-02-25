import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/model/note_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/model/time_count_model.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:idea_note/widgets/note_edit_body.dart';
import 'package:provider/provider.dart';

class NoteEditScreen extends StatelessWidget {
  const NoteEditScreen(this._index);

  final int _index;

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final settingsModel = Provider.of<SettingsModel>(context);
    final noteModel = NoteModel(storage, settingsModel);
    return FutureBuilder<bool>(
      initialData: false,
      future: noteModel.load(_index),
      builder: (context, snapshot) {
        return !snapshot.data
            ? Container()
            : MultiProvider(
                providers: [
                  ChangeNotifierProvider<NoteModel>.value(
                    value: noteModel,
                  ),
                  ChangeNotifierProvider<TimeCountModel>(
                    create: (_) => TimeCountModel()..create(),
                  )
                ],
                child: Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Row(
                          children: <Widget>[
                            Expanded(
                              child: Selector<NoteModel, Note>(
                                selector: (context, model) => model.note,
                                builder: (context, note, child) =>
                                    SelectableText(note.title),
                              ),
                            ),
                            Selector<TimeCountModel, String>(
                              selector: (context, model) => model.timeStr,
                              builder: (context, count, child) => Text(
                                count.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      body: Selector<NoteModel, Note>(
                        selector: (context, model) => model.note,
                        builder: (context, note, child) => NoteEditBody(note),
                      ),
                      floatingActionButton: _FloatingActionButton(),
                    );
                  },
                ),
              );
      },
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteModel = Provider.of<NoteModel>(context);
    final timeCountModel = Provider.of<TimeCountModel>(context);
    final appLocalizationsLabels = AppLocalizations.of(context);
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.save),
          backgroundColor: Colors.red,
          label: appLocalizationsLabels.save,
          onTap: () => Navigator.of(context).pop(noteModel.note),
        ),
        SpeedDialChild(
          child: Icon(timeCountModel.isRunning
              ? FontAwesomeIcons.stopCircle
              : FontAwesomeIcons.playCircle),
          backgroundColor: Colors.red,
          label: timeCountModel.isRunning
              ? appLocalizationsLabels.stopCount
              : appLocalizationsLabels.playCount,
          onTap: () {
            timeCountModel.isRunning
                ? timeCountModel.stop()
                : timeCountModel.start();
          },
        ),
        SpeedDialChild(
          child: Icon(FontAwesomeIcons.book),
          backgroundColor: Colors.red,
          label: appLocalizationsLabels.changeTitle,
          onTap: noteModel.changeTitle,
        ),
      ],
    );
  }
}
