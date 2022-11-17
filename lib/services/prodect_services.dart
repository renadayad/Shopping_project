import 'package:http/http.dart' as http;
import 'package:shop_app/model/prodect_models.dart';
import 'package:shop_app/utils/my_string.dart';

class ProdectServices {
  static Future<List<ProdectModel>> getProdect() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jasonData = response.body;
      return prodectModelFromJson(jasonData);
    } else {
      return throw Exception("Failed to load prodect");
    }
  }
}
