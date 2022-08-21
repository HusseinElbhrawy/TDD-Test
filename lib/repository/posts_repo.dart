import 'package:flutter_tdd_testing/datasources/remote_datasource.dart';
import 'package:flutter_tdd_testing/models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getOnePost();
  Future<PostModel> postOnePost();
  Future<PostModel> putOnePost();
  Future<void> deletePost();
}

class PostsRepositoryImple implements PostsRepository {
  final RemoteDataSources remoteDataSources;

  PostsRepositoryImple(this.remoteDataSources);
  @override
  Future<void> deletePost() async {
    return await remoteDataSources.deletePost();
  }

  @override
  Future<PostModel> getOnePost() async {
    return await remoteDataSources.getOnePost();
  }

  @override
  Future<List<PostModel>> getPosts() async {
    return await remoteDataSources.getPosts();
  }

  @override
  Future<PostModel> postOnePost() async {
    return await remoteDataSources.postOnePost();
  }

  @override
  Future<PostModel> putOnePost() async {
    return await remoteDataSources.putOnePost();
  }
}
