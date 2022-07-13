class PostModel {
  final int userID;
  final int postID;
  final String title;
  final String body;

  PostModel({
    required this.userID,
    required this.postID,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userID: json['userId'] as int,
      postID: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
