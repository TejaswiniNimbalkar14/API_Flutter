import 'package:http/http.dart' as http;
import 'package:pisyst_assignment/APIData/data.dart';

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<Data>> getData() async {
    try {
      final response =
          await http.get(Uri.https('jsonplaceholder.typicode.com', 'photos'));
      if (response.statusCode == 200) {
        final List<Data> data = dataFromJson(response.body);
        return data;
      } else
        return <Data>[];
    } catch (e) {
      return <Data>[];
    }
  }
}
