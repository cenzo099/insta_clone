enum SortType { titleAZ, titleZA, newT, oldT }

class Post implements Comparable<Post> {
  int id;
  String title;
  String content;
  final DateTime createdAt;
  String mediaUrl;

  static int _titleCount = 0;
  static SortType sortType = SortType.newT;
  static final String _mediaUrl = 'https://insta.com/user/post/title';
  Post._(this.id, this.title, this.content, this.createdAt, this.mediaUrl);
  factory Post({required String title, required String content}) {
    if (title.isEmpty) {
      throw Exception('title  can n`t is empty');
    }
    if (content.isEmpty) {
      throw Exception('content can n`t is empty');
    }
    return Post._(++_titleCount, title, content, DateTime.now(),
        '$_mediaUrl$_titleCount');
  }
  @override
  String toString() {
    return '$title : $content';
  }

  @override
  noSuchMethod(Invocation invocation) {
    return "Please write correct method!";
  }

  @override
  int get hashCode => Object.hash(id, title, content);

  @override
  bool operator ==(Object other) {
    return other is Post &&
        id == other.id &&
        title == other.title &&
        content == other.content;
  }

  @override
  int compareTo(Post other) {
    switch (sortType) {
      case SortType.oldT:
        int sortDate12 = createdAt.compareTo(other.createdAt);
        return sortDate12;
      case SortType.newT:
        int sortDate21 = other.createdAt.compareTo(createdAt);
        return sortDate21;
      case SortType.titleAZ:
        int sortAZ = title.compareTo(other.title);
        return sortAZ;
      case SortType.titleZA:
        int sortZA = other.title.compareTo(title);
        return sortZA;
    }
  }

  void postInfoForAdmin() {
    print(
        'id : $id , title : $title , content : $content , createdAt : $createdAt , URL : $mediaUrl');
  }
}

