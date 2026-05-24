import 'package:diopppp/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DioApp(),
    );
  }
}

class DioApp extends ConsumerWidget {
  const DioApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postListProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dio App'),
      ),
      body: posts.when(
        skipLoadingOnRefresh: false,
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => Text(posts[index].title),
        ),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(postListProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
