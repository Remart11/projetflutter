import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:projetfutter/product.dart';
import 'package:flutter/material.dart';
import 'package:projetfutter/produit.dart';

class DetailPage extends StatefulWidget
{
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>
{
  late Future<List> _product;
  
  @override
  void initState()
  {
    super.initState();
    
    
  }

  @override
  Widget build(BuildContext context)
  {
    var arg = ModalRoute.of(context)!.settings.arguments;
    Produit monProduit = Produit.fromJson(jsonDecode(arg.toString()));

    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('La cordée de rêve'),
        centerTitle: true,
        backgroundColor: Color(0xFFd66a12),
      ),

      body: Column
      (
        children: 
        [
          Container
          (
            height: 350,
            decoration: BoxDecoration
            (
              image: DecorationImage
              (
                image: NetworkImage(monProduit.img),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only
              (
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          Container
          (
            margin: const EdgeInsets.only(top: 25),
            child: Text
            (
              monProduit.name,
              textAlign: TextAlign.left,
              style: TextStyle
              (
                color: Color.fromARGB(255, 109, 109, 109),
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
          ),

          Container
          (
            margin: const EdgeInsets.only(top: 25),
            child: Text
            (
              monProduit.desc,
              textAlign: TextAlign.left,
              style: TextStyle
              (
                color: Color.fromARGB(255, 109, 109, 109),
                fontWeight: FontWeight.normal,
                fontSize: 15
              ),
            ),
          ),

          Container
          (
            margin: const EdgeInsets.only(top: 25),
            width: 150,
            height: 50,
            child: Center
            (
              child: Text
              (
                monProduit.price + ' €',
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

          
        ],
      ),
    );
  }
}