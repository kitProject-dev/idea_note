import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/home_model.dart';
import 'package:provider/provider.dart';

class HomeActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeModel = Provider.of<HomeModel>(context, listen: false);
    return FloatingActionButton.extended(
      elevation: 6,
      icon: const Icon(Icons.add),
      label: Text(AppLocalizations.of(context).addNote),
      onPressed: () async {
        final note = await Navigator.of(context).pushNamed(
          RoutePath.editNote,
          arguments: -1,
        ) as Note;
        if (note == null) {
          return;
        }
        await homeModel.addNote(note);
      },
    );
  }
}
