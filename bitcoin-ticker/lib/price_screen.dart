import 'dart:io' show Platform;

import 'package:bitcoin_ticker/cryptocard.dart';
import 'package:bitcoin_ticker/networking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Map<String, String> cryptoFiatValue = {};

  String selectedCurrency = currenciesList[0];
  Networking networking = Networking();

  DropdownButton<String> getDropdownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCryptoData();
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getCryptoData();
        });
      },
      children: currenciesList.map<Text>((String value) {
        return Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        );
      }).toList(),
    );
  }

  @override
  void initState() {
    super.initState();

    for (String coin in cryptoList) {
      cryptoFiatValue.addAll({coin: '?'});
    }
    print(cryptoFiatValue);
    getCryptoData();
  }

  void getCryptoData() async {
    for (String crypto in cryptoList) {
      var cryptoData = await networking.getCryptoData(
          cryptoCoin: crypto, fiatCoin: selectedCurrency);
      print(cryptoData);
      if (cryptoData != null) {
        double rate = cryptoData['rate'];
        setState(() {
          cryptoFiatValue[crypto] = rate.toStringAsFixed(2);
        });
      }
    }
  }

  List<CryptoCard> getCryptoCards() => cryptoList.map<CryptoCard>((cryptoCoin) {
    return CryptoCard(
        cryptoCoin, cryptoFiatValue[cryptoCoin], selectedCurrency);
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: getCryptoCards(),
              )),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getCupertinoPicker() : getDropdownButton(),
          ),
        ],
      ),
    );
  }
}
