import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListProducts{
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List> getAllProducts() async{
    try{

      var res = await http.get(Uri.parse(baseUrl+"/posts"));
      if(res.statusCode == 200){
        return jsonDecode(res.body);
      }
      else{
        return Future.error("erreur serveur");
      }
    }
    catch(err){
      return Future.error(err);
    }
  }
}

class Affichage extends StatefulWidget {
  const Affichage({Key? key}) : super(key: key);

  @override
  State<Affichage> createState() => _StateAffichage();
}

class _StateAffichage extends State<Affichage> {
  late Future<List> _productsList;

  @override
  void initState() {
    super.initState();
    _productsList = ListProducts.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List>(
            future: _productsList,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, i){
                      return Card(
                          child: ListTile(
                              subtitle: Column(
                                  children: [
                                    Text(snapshot.data![i]['title'], style: const TextStyle(fontSize: 20),textDirection: TextDirection.ltr),
                                    Text(snapshot.data![i]['body'], style: const TextStyle(fontSize: 20),textDirection: TextDirection.ltr)
                                  ]
                              ),
                          ),
                      );
                    }
                );
              }
              else{
                return const Center(
                    child: Text("Pas de données",textDirection: TextDirection.ltr),
                );
              }
            },
            ),
            );

  }
}
