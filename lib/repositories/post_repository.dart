import 'package:dio/dio.dart';
import '../models/post.dart';

class PostRepository {
  final Dio _dio;

  PostRepository({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Future<List<Post>> fetchPosts() async {
    final response = await _dio.get('/posts');
    return (response.data as List)
        .map((json) => Post.fromJson(json))
        .toList();
  }
}