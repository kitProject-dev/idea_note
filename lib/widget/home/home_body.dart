import 'package:flutter/material.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/home_model.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeModel = Provider.of<HomeModel>(context, listen: false);
    final themeData = Theme.of(context);
    return Selector<HomeModel, List<String>>(
      selector: (context, model) => model.notes,
      builder: (context, notes, child) => ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  notes[index],
                  style: TextStyle(
                    fontSize: themeData.textTheme.bodyText2.fontSize,
                  ),
                ),
              ),
              onTap: () async => await Navigator.of(context).pushNamed(
                RoutePath.viewNote,
                arguments: index,
              ) as Note,
              onLongPress: () => homeModel.removeNote(index),
            ),
          );
        },
      ),
    );
  }
}
