import 'package:dart_application_1/models/post.dart';

const value = 14;
void osn({int number = value}) {
  print(number);
}

void main() {
  Post post1 = Post(title: 'title1', content: 'content1');
  print(post1);
  post1.content = 'asd';
  print(post1);
  Post post2 = Post(title: 'title2', content: 'content2');
  print(post2);
  post2.title = 'hello world';
  print(post2);
  Post post3 = Post(title: 'title3', content: 'content3');
  print(post3);
  List<Post> posts = [post1, post3, post2];
  // Post.sortType = SortType.titleZA;
  // Post.sortType = SortType.titleAZ;
  // Post.sortType = SortType.oldT;
  post1.postInfoForAdmin();
  post2.postInfoForAdmin();
  post3.postInfoForAdmin();
  Post.sortType = SortType.newT;
  posts.sort();
  print(posts);
}
