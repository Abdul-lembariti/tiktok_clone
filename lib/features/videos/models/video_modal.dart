class VideoModal {
  final String title;
  final String filUrl;
  final String thumbUrl;
  final String description;
  final String creatorUid;
  final String creator;
  final int comments;
  final int likes;
  final int createAt;
  final String id;

  VideoModal({
    required this.id,
    required this.title,
    required this.filUrl,
    required this.thumbUrl,
    required this.description,
    required this.creator,
    required this.creatorUid,
    required this.comments,
    required this.likes,
    required this.createAt,
  });

  VideoModal.fromJson({
    required Map<String, dynamic> json,
    required String videoId,
  })  : title = json['title'],
        filUrl = json['filUrl'],
        thumbUrl = json['thumbUrl'],
        description = json['description'],
        creator = json['creator'],
        creatorUid = json['creatorUid'],
        comments = json['comments'],
        likes = json['likes'],
        id = videoId,
        createAt = json['createAt'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'filUrl': filUrl,
      'thumbUrl': thumbUrl,
      'description': description,
      'creator': creator,
      'creatorUid': creatorUid,
      'comments': comments,
      'likes': likes,
      'createAt': createAt,
      "id": id,
    };
  }
}
