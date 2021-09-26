class Note {
  int? id;
  String? title;
  DateTime? date;

  Note({this.title, this.date});
  Note.withId({this.id, this.title, this.date});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }

    map['title'] = title;
    map['date'] = date!.toIso8601String();
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
    );
  }
}
