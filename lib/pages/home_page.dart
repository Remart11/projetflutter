import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context) 
  {
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
                image:  AssetImage('assets/home.jpg'),
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
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              width: MediaQuery.of(context).size.width,
              child: const Text("Retrouvez tout le matériel et accessoires nécessaires pour l'escalade et la grimpe: chaussons, baudriers, cordes, sacs... et plus encore !",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  height: 2,
                                  fontSize: 25)),
                                  
              
          ),

          Container(
             height: 50,
             margin: EdgeInsets.all(10),
             child: RaisedButton(
               onPressed: () {},
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(80.0)),
               padding: EdgeInsets.all(0.0),
               child: Ink(
                 decoration: BoxDecoration(
                     gradient: LinearGradient(
                       colors: [Color(0xFF61b335), Color(0xFF4cbfd2)],
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                     borderRadius: BorderRadius.circular(30.0)),
                 child: Container(
                   constraints:
                       BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                   alignment: Alignment.center,
                   child: Text(
                     "NOS PRODUITS",
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white, fontSize: 15),
                   ),
                 ),
               ),
             ),
           ),
         
          
        ],
      ),

      floatingActionButton: FloatingActionButton
      (
        onPressed: ()
        {
          //Ce que va faire le button
        },
        child: const Text("+"),
        backgroundColor: Color(0xFFd66a12)
      ),
    );
  }
}