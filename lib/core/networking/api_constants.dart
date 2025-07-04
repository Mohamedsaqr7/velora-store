class ApiConstants {
  static const String apiBaseUrl = "https://api.escuelajs.co/";
  static const graphQl = 'graphql';
  static const String userProfile = "api/v1/auth/profile";
  static const uploadImage = 'api/v1/files/upload';
  static const products = 'api/v1/products';
  static const categories = 'api/v1/categories';

}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
