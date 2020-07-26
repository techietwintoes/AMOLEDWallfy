import 'dart:convert';
import '../constants/serviceCalls.dart';
import '../services/connectionStatus.dart';
import '../services/responses.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

/*
 * 1. set global data variables
 * 2. fetch data 
 * 3. fetch more data 
 * 4. merge more data to original data 
 */
class NatureWallfy with ChangeNotifier {
  NatureWallfy();

  // String _jsonResonse = "";
  bool _isFetching = false;
  bool _isLoading = false;

  List<UnsplashResult> wallsData = List<UnsplashResult>();

  ConnectionStatus _connection = ConnectionStatus.getInstance();

  bool get isFetching =>
      _isFetching; // It is checking whether data is fetched from the server or not yet.

  bool get isLoading =>
      _isLoading; // It is checking whether more data is fetched from the server or not yet.

  void loadmore() async {
    FzCalls.page = FzCalls.page + 1;
    List<UnsplashResult> walls = await fetchData(page: FzCalls.page);
    wallsData.addAll(walls);
    notifyListeners();
  }

  void getHomeData() async {
    List<UnsplashResult> walls = await fetchData(page: 1);
    wallsData.addAll(walls);
    notifyListeners();
  }

  Future<List<UnsplashResult>> fetchData({int page}) async {
    page == 1 ? _isFetching = true : _isLoading = true;
    String jsonResponse = '';
    notifyListeners();
    await _connection.checkConnection();

    if (_connection.hasConnection) {
      var response = await http.get(FzCalls.baseURL +
          '?client_id=' +
          FzCalls.clientId +
          '&query=' +
          FzCalls.natureQuery +
          '&per_page=' +
          FzCalls.perPage.toString() +
          '&orientation=' +
          FzCalls.orientation +
          '&page=' +
          page.toString() +
          '&content_filter=' +
          FzCalls.contentFilter +
          '&order_by=' +
          FzCalls.orderBy +
          '');

      if (response.statusCode == 200) {
        jsonResponse = response.body;
      }
    } else {
      jsonResponse = 'No';
    }

    page == 1 ? _isFetching = false : _isLoading = false;
    notifyListeners();

    List<UnsplashResult> walls = List<UnsplashResult>();
    if (jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(jsonResponse);
      walls = Unsplash.fromJson(json).results;
    }
    return walls;
  }

  List<UnsplashResult> getResponseJson() => wallsData;
}
