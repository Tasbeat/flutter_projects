import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/util/api_exception.dart';

import '../../di/di.dart';

abstract class CategoryDatasource {
  Future<List<Category>> getCategoriesList();
}

class CategoryRemoteDatasource extends CategoryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<Category>> getCategoriesList() async {
    try {
      var response = await _dio.get('collections/category/records');
      return response.data['items']
          .map<Category>((jsonObject) => Category.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown');
    }
  }
}
