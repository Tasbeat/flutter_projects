import 'package:mvvm_sample/models/any_model.dart';
import 'package:mvvm_sample/services/api/network_api.dart';

abstract class WebApi extends NetworkApi {
  Future<List<AnyModel>> getInstancesList();
}
