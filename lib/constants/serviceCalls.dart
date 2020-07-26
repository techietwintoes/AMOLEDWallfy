class FzCalls {
  FzCalls._();

  //* Service Caller Settings
  static const String baseURL = "https://api.unsplash.com/search/photos";
  // frazile.com
  static const String clientId =
      "6fa91622109e859b1c40218a5dead99f7262cf4f698b1e2cb89dd18fc5824d15";
  static const String orientation = "portrait";
  static const int perPage = 10;
  static const String contentFilter = 'high';
  static const String orderBy = 'latest';
  static int page = 1;

  // Queries
  static const String girlsQuery = 'GIRLS';
  static const String eroticQuery = 'EROTIC';
  static const String darkQuery = 'DARK';
  static const String abstractQuery = 'ABSTRACT';
  static const String minimalQuery = 'MINIMAL';
  static const String natureQuery = 'NATURE';
  static const String otherQuery = 'AMOLED';
}
