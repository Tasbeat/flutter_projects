import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/datasource/authentication_datasource.dart';
import 'package:ecommerce_app/util/api_exception.dart';

abstract class AuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);
}

class AuthenticationRepository extends AuthRepository {
  final AuthenticationDatasource datasource = AuthenticationRemote();
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
}
