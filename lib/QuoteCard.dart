import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Quote.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(5,5,5,0),
            child: Text(
              quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(5,5,5,5),
            child: Text(
              quote.author,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(5,5,5,5),
            child: FlatButton.icon(
              onPressed: delete,
              label: Text('DELETE'),
              icon: Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }
}