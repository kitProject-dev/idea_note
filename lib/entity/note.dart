class Note {
  Note(this.title, this.content);

  Note.fromJson(Map<String, dynamic> json)
      : title = json[_keyTitle] as String,
        content = json[_keyContent] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
        _keyTitle: title,
        _keyContent: content,
      };

  static const String _keyTitle = 'title';
  static const String _keyContent = 'content';

  String title;
  String content;

  void update(Note note) {
    title = note.title;
    content = note.content;
  }
}
