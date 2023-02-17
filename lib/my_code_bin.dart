


// Future<UserAlbum> getAlbumsData() async {
//   var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
//   var data = jsonDecode(response.body);
//   print("response.body: ${response.body}");
//   print("data: $data");
//
//   return UserAlbum.fromJson(data);
// }



// class UserAlbum {
//   int? userId;
//   int? id;
//   String? title;
//
//   UserAlbum({this.userId, this.id, this.title});
//
//   UserAlbum.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     return data;
//   }
// }
