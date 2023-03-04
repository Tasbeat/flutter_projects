import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/datasource/category_datasource.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/util/api_exception.dart';

abstract class CatRepository {
  Future<Either<String, List<Category>>> getCategoriesList();
}

class CategoryRepository extends CatRepository {
  final CategoryDatasource categoryDatasource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategoriesList() async {
    try {
      final categoryList = await categoryDatasource.getCategoriesList();
      return Right(categoryList);
    } on ApiException catch (ex) {
      return Left('${ex.message}:خطایی رخ داده است');
    }
  }
}
