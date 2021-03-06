class Note {
  Note(this.title, this.content);

  Note.fromJson(Map<String, dynamic> json)
      : title = json[_keyTitle] as String,
        dateTime = json[_dateTime] as int,
        content = json[_keyContent] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        _keyTitle: title,
        _dateTime: dateTime,
        _keyContent: content,
      };

  static const String _keyTitle = 'title';
  static const String _dateTime = 'date_time';
  static const String _keyContent = 'content';

  String title;
  int dateTime;
  String content;

  void update(Note note) {
    title = note.title;
    dateTime = note.dateTime;
    content = note.content;
  }
}
