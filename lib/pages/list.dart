// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListProducts
{
  static String baseUrl = "http://127.0.0.1:5000/";

  static Future<List> getAllProducts() async
  {
    try
    {
      var res = await http.get(Uri.parse(baseUrl));
      if(res.statusCode == 200)
      {
        print(res.body[0]);
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
}

class ListPage extends StatefulWidget
{
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => ListPageState();
}

class ListPageState extends State<ListPage>
{
  late Future<List> _productsList;

  @override
  void initState()
  {
    super.initState();
    _productsList = ListProducts.getAllProducts();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Color(0xFFD3D3D3),
      appBar: AppBar
      (
        title: const Text('La cordée de rêve'),
        centerTitle: true,
        backgroundColor: Color(0xFFd66a12),
      ),

      body: Container
      (
        child: FutureBuilder<List>
        (
          future: _productsList,
          builder: (context, snapshot)
          {
            if(snapshot.hasData)
            {
              return ListView.builder
              (
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i)
                {
                  return Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>
                    [
                      InkWell
                      (
                        onTap: ()
                        {
                          print("titer");
                        },
                        child: Container
                        (
                          margin: const EdgeInsets.only(top: 50),
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration
                          (
                            borderRadius: BorderRadius.only
                            (
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            gradient: LinearGradient
                            (
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xFF4cbfd2),Color(0xFF61b335),],
                            )
                          ),
                          child: FractionalTranslation
                          (
                            translation: Offset(0, 0),
                            child: Center
                            (
                              child: Text
                              (
                                snapshot.data![i]['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle
                                (
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25
                                ),
                              ),
                            )
                          ),
                        ),
                      ),

                      InkWell
                      (
                        onTap: ()
                        {
                          print("image");
                        },
                        child: ClipRRect
                        (

                          borderRadius: BorderRadius.only
                          (
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),

                          child: SizedBox.fromSize
                          (
                            size: Size(300,320), // Image radius
                            child: Image.network(snapshot.data![i]['img'], fit: BoxFit.cover),
                          ),
                        ),
                      ),

                      InkWell
                      (
                        onTap: ()
                        {
                          print("prix");
                        },
                        child: FractionalTranslation
                        (
                          translation: Offset(0, -0.5),
                          child: Container
                          (
                            width: 150,
                            height: 50,
                            child: Center
                            (
                              child: Text
                              (
                                snapshot.data![i]['price'],
                                style: TextStyle
                                (
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                            decoration: BoxDecoration
                            (
                              gradient: LinearGradient
                              (
                                colors: [Color(0xFF61b335), Color(0xFF4cbfd2)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 3, color: Colors.white)
                            ),
                          ),
                        ),
                      )



                    ],
                  );
                }
              );
            }
            else
            {
              return const Center
              (
                  child: Text("Pas de données",textDirection: TextDirection.ltr),
              );
            }
          },
        ),
      ),
    );
  }
}
