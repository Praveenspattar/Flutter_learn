import 'dart:convert';

import 'package:flutter_memmer/model/memes_response.dart';

// class Homeview extends StatelessWidget {
//   const Homeview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Memer app,',
      
//       home: Homeview(),
//     );
//   }
// }
import 'package:http/http.dart' as http;

abstract class API{
  static const String _baseUrl = 'http://api.imgflip.com';

  static Future<MemesResponse> getMemes() async{
    final response = 
      await http.get(Uri.parse('$_baseUrl/get_memes'));
    if(response.statusCode == 200){
      final MemesResponse memesResponse = MemesResponse.fromJson(jsonDecode(response.body));
      return memesResponse;
    } else {
      throw Exception('Failed to load memes');
    }
  }
}