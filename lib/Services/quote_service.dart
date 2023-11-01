import 'dart:convert';

import 'package:bana/Model/quote_model.dart';
import 'package:http/http.dart' as http;

class QuoteService{

  static Future<Quote?> getQuote() async{

    final response = await http.get(Uri.parse('https://buddha-api.com/api/random'));

    if(response.statusCode == 200){
      return Quote.fromJson(jsonDecode(response.body));
    }
    return null;

  }



}