import 'package:flutter/material.dart';

class CryptoCard extends StatefulWidget {
  final _cryptoCoin;
  final _cryptoFiatValue;
  final _selectecCurrence;


  CryptoCard(this._cryptoCoin, this._cryptoFiatValue, this._selectecCurrence);

  @override
  _CryptoCardState createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 ${widget._cryptoCoin} = ${widget._cryptoFiatValue} ${widget._selectecCurrence}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
