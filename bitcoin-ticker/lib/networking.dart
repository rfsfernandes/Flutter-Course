import 'package:bitcoin_ticker/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String _cryptoCoin;
  String _fiatCoin;

  Networking();

  Future<dynamic> getCryptoData({cryptoCoin: String, fiatCoin: String}) async {
    _cryptoCoin = cryptoCoin;
    _fiatCoin = fiatCoin;

    var url = Uri.parse('$kBaseUrl/$_cryptoCoin/$_fiatCoin');

    var response = await http.get(url, headers: {'X-CoinAPI-Key': kApiKey});

    var cryptoData = jsonDecode(response.body);

    return cryptoData;

  }

}