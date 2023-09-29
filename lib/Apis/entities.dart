import 'package:http/http.dart' as http;

class Entities {
  static Future<Map<String, dynamic>> getEntitites() async {
    const url = "https://iiit-bhubaneswar-accounts-backend.onrender.com/entities";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return {"status": "success", "data": response.body};
    }
    else{
      return {"status": "error", "data": response.body};
    }
  }

  static Future<Map<String, dynamic>> getTotal() async {
    const url = "https://iiit-bhubaneswar-accounts-backend.onrender.com/entities/sum";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return {"status": "success", "data": response.body};
    }
    else{
      return {"status": "error", "data": response.body};
    }
  }
}
