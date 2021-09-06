import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';


class NetworkHelper{
  String url;
  NetworkHelper(this.url);

  Future getdata(BuildContext context) async{
    http.Response res= await http.get(Uri.parse(url));
    if(res.statusCode==200) {
      String data = res.body;
      return jsonDecode(data);
    }

    else
    {
      print(res.statusCode);
      Alert(context:context, title: "Error in connection with API", desc: "${res.statusCode}").show();

    }

  }

}