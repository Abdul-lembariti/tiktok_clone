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

  VideoModal({
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
    };
  }
}
