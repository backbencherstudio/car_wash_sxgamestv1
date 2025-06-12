class BlogModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? status;
  String? title;
  String? slug;
  String? content;
  String? thumbnail;
  String? category;
  int? views;
  bool? isFeatured;
  String? userId;
  User? user;
  String? thumbnailUrl;

  BlogModel(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.status,
        this.title,
        this.slug,
        this.content,
        this.thumbnail,
        this.category,
        this.views,
        this.isFeatured,
        this.userId,
        this.user,
        this.thumbnailUrl});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
    title = json['title'];
    slug = json['slug'];
    content = json['content'];
    thumbnail = json['thumbnail'];
    category = json['category'];
    views = json['views'];
    isFeatured = json['is_featured'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['status'] = status;
    data['title'] = title;
    data['slug'] = slug;
    data['content'] = content;
    data['thumbnail'] = thumbnail;
    data['category'] = category;
    data['views'] = views;
    data['is_featured'] = isFeatured;
    data['user_id'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['thumbnail_url'] = thumbnailUrl;
    return data;
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) => BlogModel.fromJson(map);

  Map<String, dynamic> toMap() => toJson();

  @override
  String toString() {
    return 'BlogModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, '
        'status: $status, title: $title, slug: $slug, content: $content, thumbnail: $thumbnail, '
        'category: $category, views: $views, isFeatured: $isFeatured, userId: $userId, '
        'user: $user, thumbnailUrl: $thumbnailUrl)';
  }
}

class User {
  String? id;
  String? name;
  String? avatar;
  String? avatarUrl;

  User({this.id, this.name, this.avatar, this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['avatar_url'] = avatarUrl;
    return data;
  }

  factory User.fromMap(Map<String, dynamic> map) => User.fromJson(map);

  Map<String, dynamic> toMap() => toJson();

  @override
  String toString() {
    return 'User(id: $id, name: $name, avatar: $avatar, avatarUrl: $avatarUrl)';
  }
}