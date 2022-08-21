import 'package:flutter_tdd_testing/cubit/posts_cubit.dart';
import 'package:flutter_tdd_testing/cubit/posts_state.dart';
import 'package:flutter_tdd_testing/models/post_model.dart';
import 'package:flutter_tdd_testing/repository/posts_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'posts_cubit_test.mocks.dart';

@GenerateMocks([PostsRepository])
void main() {
  late PostsCubit postsCubit;
  late PostsRepository postsRepository;

  setUp(() {
    postsRepository = MockPostsRepository();
    postsCubit = PostsCubit(postsRepository);
  });

  group('Testing Get Posts in Cubit', () {
    test(
      'posts cubit should execute loading and loaded without errors',
      () async {
        //!Arrange
        final posts = List.generate(
          5,
          (index) => PostModel(
            userId: index,
            id: index,
            title: 'title$index',
            body: 'body$index',
          ),
        );
        when(postsRepository.getPosts()).thenAnswer(
          (_) => Future.value(posts),
        );
        //!Assets
        final exceptedStates = [
          PostsLoading(),
          PostsLoaded(posts),
        ];
        expectLater(postsCubit.stream, emitsInAnyOrder(exceptedStates));
        //!Act
        await postsCubit.getPosts();
      },
    );

    test('Get Post should throw exception', () async {
      //!Arrange
      when(postsRepository.getPosts()).thenAnswer(
        (realInvocation) async => throw Exception(),
      );
      //!Asserts
      expectLater(
        postsCubit.stream,
        emitsInAnyOrder(
          [
            PostsLoading(),
            PostsError(''),
          ],
        ),
      );
      //!Act
      await postsCubit.getPosts();
    });
  });
}
