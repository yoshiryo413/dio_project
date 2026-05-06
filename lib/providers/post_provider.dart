import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/post.dart';
import '../repositories/post_repository.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository();
});

final postListProvider = FutureProvider<List<Post>>((ref) async {
  final repository = ref.read(postRepositoryProvider);
  return repository.fetchPosts();
});