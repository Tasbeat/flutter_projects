class ApiException implements Exception {
  int? code;
  String? message;
  ApiException(
    int? statusCode,
    data, {
    this.code,
    this.message,
  });
}
