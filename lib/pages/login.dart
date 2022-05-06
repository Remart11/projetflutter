import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';


class Connection{

  static String baseUrl = "http://127.0.0.1:5000/connect";

  static Future<List> getConnect() async
  {
    try
    {
      print('couc1');
      var res = await http.get(Uri.parse(baseUrl));
      print('dwgfg');
      if(res.statusCode == 200)
      {
        return jsonDecode(res.body)['connected'];
      }
      else
      {
        return Future.error("erreur serveur");
      }
    }
    catch(err)
    {
      print(err);
      return Future.error(err);
    }
  }
}

class LoginPage extends StatefulWidget
{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
{
  late Future<List> _connected;

  @override
  void initState()
  {
    super.initState();
    _connected = Connection.getConnect();
  }

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
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your username',
                            ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                        child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your password',
                            ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 36),
                        child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(Duration(seconds: 2), () {
                                      Navigator.of(context).pop(true);
                                      Navigator.pushNamed(context, '/');
                                    });
                                    return AlertDialog(
                                        // Retrieve the text the that user has entered by using the
                                        // TextEditingController.
                                        content: Text('Connected ! 😁'),
                                    );
                                  },
                              );
                            },
                            child: Text('Enter'),
                        )
                    )

                        ],
                        ),
                        ),
                        ],
                        ),
                        );
  }
}
