import 'package:dio/dio.dart';
import 'package:flutter_tdd_testing/core/services/network_services.dart';
import 'package:flutter_tdd_testing/datasources/remote_datasource.dart';
import 'package:flutter_tdd_testing/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([NetworkServices])
void main() {
  late NetworkServices networkServices;
  late RemoteDataSourcesImplementation remoteDataSources;
  //! Setup Var used in Test
  setUp(() {
    networkServices = MockNetworkServices();
    remoteDataSources = RemoteDataSourcesImplementation(networkServices);
  });
  group(
    'Testing GetPosts with data and Exception',
    () {
      test(
        'Get Post should return List of Posts without any exception ',
        () async {
          //Arrange
          final posts = List.generate(
            5,
            (index) => PostModel(
              userId: index,
              id: index,
              title: 'title$index',
              body: 'body$index',
            ),
          );

          when(networkServices
                  .get('https://jsonplaceholder.typicode.com/posts'))
              .thenAnswer(
            (_) {
              return Future.value(
                Response(
                  requestOptions: RequestOptions(
                    path: 'https://jsonplaceholder.typicode.com/posts',
                  ),
                  statusCode: 200,
                  data: posts,
                ),
              );
            },
          );

          //Act
          final result = await remoteDataSources.getPosts();
          //Assets
          expect(result, posts);
        },
      );
      test(
        'Get Post should return Exception  ',
        () async {
          //Arrange

          when(networkServices
                  .get('https://jsonplaceholder.typicode.com/posts'))
              .thenAnswer(
            (_) {
              return Future.value(
                Response(
                  requestOptions: RequestOptions(
                    path: 'https://jsonplaceholder.typicode.com/posts',
                  ),
                  statusCode: 404,
                ),
              );
            },
          );

          //Act
          final result = () async => await remoteDataSources.getPosts();
          //Assets
          expect(result, throwsA(isA<Exception>()));
        },
      );
    },
  );

  group(
    'Testing GetOnePost with data and with exception ',
    () {
      test(
        'Get One post should return only one post without any exceptions ',
        () async {
          //Arrange
          final post = PostModel(
            userId: 0,
            id: 0,
            title: 'title',
            body: 'body',
          );

          when(networkServices
                  .get('https://jsonplaceholder.typicode.com/posts/1'))
              .thenAnswer(
            (realInvocation) => Future.value(
              Response(
                requestOptions: RequestOptions(
                    path: 'https://jsonplaceholder.typicode.com/posts/1'),
                statusCode: 200,
                data: post,
              ),
            ),
          );
          //Act
          final result = await remoteDataSources.getOnePost();
          //Assets
          expect(result, post);
        },
      );
      test(
        'Get One post should Exceptions  ',
        () async {
          //Arrange

          when(networkServices
                  .get('https://jsonplaceholder.typicode.com/posts/1'))
              .thenAnswer(
            (realInvocation) => Future.value(
              Response(
                requestOptions: RequestOptions(
                    path: 'https://jsonplaceholder.typicode.com/posts/1'),
                statusCode: 404,
              ),
            ),
          );
          //Act
          final result = () async => await remoteDataSources.getOnePost();
          //Assets
          expect(result, throwsA(isA<Exception>()));
        },
      );
    },
  );

  group(
    'Testing Post data with success and fail',
    () {
      test(
        'Post data should post one Post with out any exceptions ',
        () async {
          //Arrange

          when(
            networkServices.post(
              'https://jsonplaceholder.typicode.com/posts',
              {
                "id": 101,
                "title": "foo",
                "body": "bar",
                "userId": 1,
              },
            ),
          ).thenAnswer(
            (_) => Future.value(
              Response(
                statusCode: 201,
                data: {"id": 101, "title": "foo", "body": "bar", "userId": 1},
                requestOptions: RequestOptions(
                  path: 'https://jsonplaceholder.typicode.com/posts',
                ),
              ),
            ),
          );
          //Act
          final result = await remoteDataSources.postOnePost();
          //Assert
          expect(
            result,
            PostModel(userId: 1, id: 101, title: 'foo', body: 'bar'),
          );
        },
      );

      test(
        'Post data should return Exceptions  ',
        () async {
          //Arrange

          when(
            networkServices.post(
              'https://jsonplaceholder.typicode.com/posts',
              {
                "id": 101,
                "title": "foo",
                "body": "bar",
                "userId": 1,
              },
            ),
          ).thenAnswer(
            (_) => Future.value(
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(
                  path: 'https://jsonplaceholder.typicode.com/posts',
                ),
              ),
            ),
          );
          //Act
          final result = () async => await remoteDataSources.postOnePost();
          //Assert
          expect(
            result,
            throwsA(isA<Exception>()),
          );
        },
      );
    },
  );

  group(
    'Testing Put Data with success and fail',
    () {
      test(
        'Put should return data ',
        () async {
          //arrange
          final postModel = PostModel(
            userId: 1,
            id: 1,
            title: 'foo',
            body: 'bar',
          );

          when(networkServices.put(
            'https://jsonplaceholder.typicode.com/posts/1',
            postModel.toMap(),
          )).thenAnswer(
            (_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: 'https://jsonplaceholder.typicode.com/posts/1',
                ),
                statusCode: 200,
                data: postModel.toMap(),
              ),
            ),
          );
          //act
          final result = await remoteDataSources.putOnePost();
          //assert
          expect(result, postModel);
        },
      );
      test(
        'Testing put data should return exception',
        () async {
          ///Arrange
          when(
            networkServices.put(
              'https://jsonplaceholder.typicode.com/posts/1',
              {"id": 1, "title": "foo", "body": "bar", "userId": 1},
            ),
          ).thenAnswer(
            (_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                    path: 'https://jsonplaceholder.typicode.com/posts/1'),
                statusCode: 404,
              ),
            ),
          );

          ///act
          final result = () async => await remoteDataSources.putOnePost();

          ///asserts
          expect(result, throwsA(isA<Exception>()));
        },
      );
    },
  );

  test(
    'Delete Post',
    () async {
      ///arrange
      when(
        networkServices.delete(
          'https://jsonplaceholder.typicode.com/posts/2',
        ),
      ).thenAnswer(
        (realInvocation) => Future.value(
          Response(
            statusCode: 200,
            requestOptions: RequestOptions(
              path: 'https://jsonplaceholder.typicode.com/posts/2',
            ),
          ),
        ),
      );

      ///act
      final result = await remoteDataSources.deletePost();

      ///asserts
      expect(result, null);
    },
  );
}
