import '../model/blog_model.dart';

class AllBlogListState {

  List<BlogModel>? blogList;

  AllBlogListState({this.blogList});

  AllBlogListState copyWith({List<BlogModel>? blogList}) {
    return AllBlogListState(
      blogList: blogList ?? this.blogList
    );
  }
}
