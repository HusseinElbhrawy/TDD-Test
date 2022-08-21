import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_testing/models/post_model.dart';

abstract class PostsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostsLoading extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostsLoaded extends PostsState {
  final List<PostModel> list;

  PostsLoaded(this.list);

  @override
  List<Object?> get props => [list];
}

class PostsError extends PostsState {
  final String message;
  PostsError(this.message);

  @override
  List<Object?> get props => [message];
}
