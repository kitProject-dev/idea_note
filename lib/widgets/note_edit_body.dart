import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/entity/note.dart';

class NoteEditBody extends StatefulWidget {
  const NoteEditBody(this._note);

  final Note _note;

  @override
  _NoteEditBodyState createState() => _NoteEditBodyState();
}

class _NoteEditBodyState extends State<NoteEditBody> {
  TextEditingController _textEditingController;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(); // <- こんな感じ
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final note = widget._note;
    final themeData = Theme.of(context);
    _textEditingController.text = note.content;
    return Stack(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(),
          onTap: () => FocusScope.of(context).requestFocus(_focus),
        ),
        Scrollbar(
          child: TextField(
            controller: _textEditingController,
            onChanged: (text) => note.content = text,
            focusNode: _focus,
            autofocus: true,
            maxLines: null,
            style: themeData.textTheme.bodyText2,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(0),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
