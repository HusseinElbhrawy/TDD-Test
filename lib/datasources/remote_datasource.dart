import 'package:flutter_tdd_testing/core/services/network_services.dart';
import 'package:flutter_tdd_testing/models/post_model.dart';

abstract class RemoteDataSources {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getOnePost();
  Future<PostModel> postOnePost();
  Future<PostModel> putOnePost();
  Future<void> deletePost();
}

class RemoteDataSourcesImplementation implements RemoteDataSources {
  final NetworkServices networkServices;

  RemoteDataSourcesImplementation(this.networkServices);
  @override
  Future<List<PostModel>> getPosts() async {
    final response =
        await networkServices.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode != 200) {
      throw Exception();
    }

    final result = response.data as List<PostModel>;
    return result;
  }

  @override
  Future<PostModel> getOnePost() async {
    final response = await networkServices.get(
      'https://jsonplaceholder.typicode.com/posts/1',
    );
    if (response.statusCode != 200) throw Exception();
    return response.data;
  }

  @override
  Future<PostModel> postOnePost() async {
    final response = await networkServices.post(
      'https://jsonplaceholder.typicode.com/posts',
      {"id": 101, "title": "foo", "body": "bar", "userId": 1},
    );
    if (response.statusCode != 201) throw Exception();
    return PostModel.fromMap(response.data);
  }

  @override
  Future<PostModel> putOnePost() async {
    final postModel = PostModel(
      userId: 1,
      id: 1,
      title: 'foo',
      body: 'bar',
    );

    final response = await networkServices.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      postModel.toMap(),
    );
    if (response.statusCode != 200) throw Exception();
    return PostModel.fromMap(response.data);
  }

  @override
  Future deletePost() async {
    final response = await networkServices
        .delete('https://jsonplaceholder.typicode.com/posts/2');
    if (response.statusCode != 200) throw Exception();
    return response.data;
  }
}
