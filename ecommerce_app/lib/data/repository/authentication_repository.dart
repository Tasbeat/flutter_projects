import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/datasource/authentication_datasource.dart';
import 'package:ecommerce_app/util/api_exception.dart';
import 'package:ecommerce_app/util/auth_manager.dart';

import '../../di/di.dart';

abstract class AuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository extends AuthRepository {
  final AuthenticationDatasource datasource = locator.get();
  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await datasource.register(username, password, passwordConfirm);
      return right('ثبت نام انجام شد');
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      var token = await datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('وارد شده اید!');
      } else {
        return left('خطایی پیش آمده');
      }
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطایی رخ داده');
    }
  }
}
