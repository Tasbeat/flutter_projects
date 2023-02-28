import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/datasource/authentication_datasource.dart';
import 'package:ecommerce_app/data/repository/authentication_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //components
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://startflutter.ir/api/')));

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //datasources
  locator
      .registerFactory<AuthenticationDatasource>(() => AuthenticationRemote());

  //repositories
  locator.registerFactory<AuthRepository>(() => AuthenticationRepository());
}
