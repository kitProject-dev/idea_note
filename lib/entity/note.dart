class Note {
  Note(this.title, this.content);

  String title;
  String content;

  void update(Note note) {
    title = note.title;
    content = note.content;
  }
}
