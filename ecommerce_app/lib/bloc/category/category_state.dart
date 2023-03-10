part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryResponseInProgress extends CategoryState {}

class CategoryResponseSuccess extends CategoryState {
  final Either<String, List<Category>> response;

  CategoryResponseSuccess({required this.response});
}
