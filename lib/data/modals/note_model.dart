class NoteModel {
  final String title;
  int? id;
  String content;
  final String description;
  final String createdAt;

  NoteModel({
    required this.title,
    required this.createdAt,
    this.id,
    required this.content,
    required this.description,
  });

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "created_at": createdAt,
      "content": content,
    };
  }
}
