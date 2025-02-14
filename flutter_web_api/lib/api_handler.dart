import 'dart:convert';

import 'package:flutter_web_api/model.dart';
import 'package:http/http.dart' as http;
class ApiHandler{
 final String baseUrl = "https://localhost:7258/api/users";

 Future<List<User>> getUserData() async {
   List<User> data = [];
   final uri = Uri.parse(baseUrl);

   try {
    final response = await http.get(
     uri,
     headers: <String,String>{
      'Content-type':'application/json; charset=UTF-8'
     },
    );

    if(response.statusCode >= 200 && response.statusCode <= 299){
      final List<dynamic> jsonData = json.decode(response.body);
      data = jsonData.map((json)=> User.fromJson(json)).toList();
    }

   } catch(ex){
    return data;
   }
   return data;
  }

  Future<http.Response> updateUser({required int userId, required User user}) async{
    final uri = Uri.parse("$baseUrl/$userId");
    late http.Response response;
    try{
      response = await http.put(
        uri,
        headers: <String, String>{
          'Content-type':'application/json; charset=UTF-8'
        },
        body: json.encode({
          'id': userId,
          'name': user.name,
          'address': user.address
        })
      );
    }catch(ex) {
      return response;
    }

    return response;
  }

  Future<http.Response> addUser({required User user}) async{
   final uri = Uri.parse(baseUrl);
   late http.Response response;

   try{
    response = await http.post(
        uri,
        headers: <String, String>{
          'Content-type':'application/json; charset=UTF-8'
        },
        body: json.encode(user)
    );
   } catch(ex){
     return response;
   }
   return response;
  }

  Future<http.Response> deleteUser({required int userId}) async{
   final uri = Uri.parse("$baseUrl/$userId");
   late http.Response response;

   try{
    response = await http.delete(
      uri,
      headers: <String, String>{
        'Content-type':'application/json; charset=UTF-8'
      },
    );
   }catch(e){
     return response;
   }
   return response;
  }

  Future<User> getUserById({required int userId}) async{
    final uri = Uri.parse("$baseUrl/$userId");
    User? user;

    try {
      final response = await http.get(
        uri,
        headers: <String,String>{
          'Content-type':'application/json; charset=UTF-8'
        },
      );

      if(response.statusCode >= 200 && response.statusCode <= 299){
        final Map<String,dynamic> jsonData= json.decode(response.body);
        user = User.fromJson(jsonData);
      }

    } catch(ex){
      return user!;
    }
    return user!;
  }
}