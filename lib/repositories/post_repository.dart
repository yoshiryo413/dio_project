import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostRepository {
  final Dio _dio;

  PostRepository({Dio? dio})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Future<List<Post>> fetchPosts() async {
    debugPrint('🌐 fetchPosts called at ${DateTime.now()}');
    await Future.delayed(const Duration(seconds: 3));  
    final response = await _dio.get('/posts');
    return (response.data as List)
        .map((json) => Post.fromJson(json))
        .toList();
  }
}