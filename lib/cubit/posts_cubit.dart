import 'package:bloc/bloc.dart';
import 'package:flutter_tdd_testing/repository/posts_repo.dart';

import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(
    this.postsRepository,
  ) : super(PostsInitial());
  final PostsRepository postsRepository;
  Future<void> getPosts() async {
    emit(PostsLoading());

    try {
      final posts = await postsRepository.getPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError(''));
    }
  }
}
