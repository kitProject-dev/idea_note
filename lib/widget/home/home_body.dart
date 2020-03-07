import 'package:flutter/material.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/home_model.dart';
import 'package:idea_note/widget/home/home_card.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<HomeModel, List<Note>>(
      selector: (context, model) => model.notes,
      builder: (context, notes, child) => ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return HomeCard(index, notes[index]);
        },
      ),
    );
  }
}
