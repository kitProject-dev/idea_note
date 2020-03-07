import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/edit_note_model.dart';
import 'package:provider/provider.dart';

class EditNoteBody extends StatefulWidget {
  @override
  _EditNoteBodyBodyState createState() => _EditNoteBodyBodyState();
}

class _EditNoteBodyBodyState extends State<EditNoteBody> {
  TextEditingController _textEditingController;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Selector<EditNoteModel, Note>(
      selector: (context, model) => model.note,
      builder: (context, note, child) {
        _textEditingController.text = note.content;
        return Stack(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Container(
                color: themeData.cardColor,
              ),
              onTap: () => FocusScope.of(context).requestFocus(_focus),
            ),
            Scrollbar(
              child: TextField(
                controller: _textEditingController,
                onChanged: (text) => note.content = text,
                focusNode: _focus,
                autofocus: true,
                maxLines: null,
                style: themeData.textTheme.body1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
