import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/data/repository/category_repository.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CatRepository catRepository = locator.get();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is CategoryGetRequest) {
        emit(CategoryResponseInProgress());
        final response = await catRepository.getCategoriesList();
        emit(CategoryResponseSuccess(response: response));
      }
    });
  }
}
