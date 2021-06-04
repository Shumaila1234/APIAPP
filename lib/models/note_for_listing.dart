class NoteforListing{
  String noteID;
  String noteTitle;
  DateTime createDatetime;
  DateTime latestDatetime;
  
  NoteforListing({
    this.noteID,
    this.noteTitle,
    this.createDatetime,
    this.latestDatetime,
  }
  );

  factory NoteforListing.fromJson(Map<String, dynamic> item) {
    return NoteforListing(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      createDatetime: DateTime.parse(item['createDateTime']),
      latestDatetime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
