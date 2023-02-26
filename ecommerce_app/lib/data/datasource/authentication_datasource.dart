import 'package:dio/dio.dart';
import 'package:ecommerce_app/util/api_exception.dart';

abstract class AuthenticationDatasource {
  Future<void> register(
      String username, String password, String passwordConfirm);
}

class AuthenticationRemote extends AuthenticationDatasource {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/'));
  @override
  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      await dio.post('collections/users/records', data: {
        'username': username,
        'password': password,
        'passwordConfirm': passwordConfirm
      });
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw throw ApiException(0, 'Unknown');
    }
  }
}
