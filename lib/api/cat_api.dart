import 'dart:convert';

import 'package:flutter_cat/model/cat_image.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CatApi {
  static Future<CatImage> getNewCat() async {
    var url = Uri.parse('https://api.thecatapi.com/v1/images/search');
    Response response = await http.get(url);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      List data = json.decode(response.body);
      var catImage = CatImage.fromJson(data[0]);
      return catImage;
    } else {
      throw Exception("Error Loading Cat Image");
    }
  }
}
