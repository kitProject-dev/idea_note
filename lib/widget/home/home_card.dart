import 'package:flutter/material.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/home_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(this._index, this._note);

  final int _index;
  final Note _note;

  @override
  Widget build(BuildContext context) {
    final homeModel = Provider.of<HomeModel>(context, listen: false);
    final themeData = Theme.of(context);
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            title: Text(
              _note.title,
              style: themeData.textTheme.subtitle,
            ),
            subtitle: Text(
              DateFormat('yyyy/MM/dd(E) HH:mm',
                      Localizations.localeOf(context).languageCode)
                  .format(DateTime.fromMillisecondsSinceEpoch(_note.dateTime)),
              style:
                  themeData.textTheme.body1.copyWith(color: Colors.grey[500]),
            ),
          ),
        ),
        onTap: () async => await Navigator.of(context).pushNamed(
          RoutePath.viewNote,
          arguments: _index,
        ) as Note,
        onLongPress: () => homeModel.removeNote(_index),
      ),
    );
  }
}
