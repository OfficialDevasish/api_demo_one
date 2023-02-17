import 'dart:convert';
import 'package:http/http.dart' as http;
import '../all_model_class.dart';


class TodoService {

  Future<List<Todo>> getAll() async {

    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
          id: e['id'],
          title: e['title'],
          userId: e['userId'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }

    return [];
  }

}


// Future<dynamic> getLogin({String? email, String? password}) async {
//     var responseJson;
//
//     try {
//       final queryParameters = {
//         "email": email,
//         "password": password,
//       };
//
//       final uri = Uri.parse(MyConst.loginUrl);
//       final response = await http.post( uri,body: queryParameters);
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//
//     return responseJson;
//   }
//
//   dynamic _returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//     }
//
// }

