import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Product
{
  static String baseUrl = "http://127.0.0.1:5000/";

  static Future<List> getAllProducts() async
  {
    try
    {
      var res = await http.get(Uri.parse(baseUrl));
      if(res.statusCode == 200)
      {
        return jsonDecode(res.body)['products'];
      }
      else
      {
        return Future.error("erreur serveur");
      }
    }
    catch(err)
    {
      return Future.error(err);
    }
  }

  static getProductById(BuildContext context, int id) async
  {
    try
    {
      var result = await http.get(Uri.parse(baseUrl + "products/" + id.toString()));

      if(result.statusCode == 200)
      {
        Navigator.pushNamed(context, '/detail', arguments: result.body);
      }
      else
      {
        return Future.error('error server');
      }
    }
    catch(err)
    {
      return Future.error(err);
    }
  }
}