class AppApiException implements Exception {
  final String message;
  final String? errorCode;
  final int? statusCode;

  const AppApiException(
    this.message, {
    this.errorCode,
    this.statusCode,
  });
}
