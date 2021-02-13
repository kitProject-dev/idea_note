import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/model/edit_note_model.dart';
import 'package:provider/provider.dart';

class EditNoteActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final editNoteModel = Provider.of<EditNoteModel>(context);
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      children: [
        SpeedDialChild(
            child: const Icon(FontAwesomeIcons.save),
            backgroundColor: Colors.blue[300],
            label: AppLocalizations.of(context).save,
            onTap: () {
              editNoteModel.note.dateTime =
                  DateTime.now().millisecondsSinceEpoch;
              Navigator.of(context).pop(editNoteModel.note);
            }),
        SpeedDialChild(
          child: Icon(editNoteModel.isRunning
              ? FontAwesomeIcons.stopCircle
              : FontAwesomeIcons.playCircle),
          backgroundColor: Colors.blue[300],
          label: editNoteModel.isRunning
              ? AppLocalizations.of(context).stopCount
              : AppLocalizations.of(context).playCount,
          onTap: () {
            editNoteModel.isRunning
                ? editNoteModel.stopTimer()
                : editNoteModel.startTimer();
          },
        ),
        SpeedDialChild(
          child: const Icon(FontAwesomeIcons.book),
          backgroundColor: Colors.blue[300],
          label: AppLocalizations.of(context).changeTitle,
          onTap: editNoteModel.changeTitle,
        ),
      ],
    );
  }
}
