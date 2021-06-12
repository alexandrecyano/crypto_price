import 'dart:convert';
import 'package:crypto_price/models/coin_model.dart';
import 'package:crypto_price/models/failure_module.dart';
import 'package:http/http.dart' as http;

class CrytoRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com/';
  static const int perPage = 20;

  final http.Client _httpClient;

  CrytoRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Coin>> getTopCoins() async {
    final requestUrl =
        '${_baseUrl}data/top/totalvolfull?limit=$perPage&tsym=EUR';
    try {
      final response = await _httpClient.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        final coinList = data['Data'];
        return coinList.map((e) => Coin.fromMap(e)).toList();
      }
      return [];
    } catch (err) {
      print(err);
      throw Failure(message: err.toString());
    }
  }
}
