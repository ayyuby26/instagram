class ContentModel {
  final int id;
  final String description;
  final int likes;
  final String contentPath;
  String contentUrl;

  ContentModel({
    required this.description,
    required this.likes,
    required this.id,
    required this.contentPath,
    this.contentUrl = "",
  });

  factory ContentModel.fromjson(Map<String, dynamic> x) {
    return ContentModel(
      id: x['id'],
      description: x['description'],
      likes: x['likes'],
      contentPath: x['content'],
      contentUrl: x['contentUrl'] ?? "",
    );
  }
}
