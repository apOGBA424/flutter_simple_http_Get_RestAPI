**Project Name:**  <h1>**App**


## **Description** :
A simple flutter app for performing **_GET_** request on _https://jsonplaceholder.typicode.com/posts/_ endpoint using flutter [http package](https://pub.dev/packages/http 'click to see lastest version') from [pub.dev](http://pub.dev 'click to open the site').

<br>


### **Snippet source code below :** ### 

#### _services/network/http_service.dart_ ####

```dart
import 'dart:convert';

import 'package:app/model/post_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  List<PostModel> allPost = []; //a Global list to hold all Post data.

  Future<List<PostModel>> getData() async {
    var url = Uri.parse(baseUrl);
    var res = await http.get(url);

    if (res.statusCode == 200) {
      List jsonResponseBody = jsonDecode(res.body);

      for (var eachPost in jsonResponseBody) {
        print('post-nọ: ${eachPost['id']}');
        print('user-id:  ${eachPost['userId']}');
        print('post-title:  ${eachPost['title']}');
        print('post-body:  ${eachPost['body']}');
        print('');

        //send "eachPost" value to "Post.fromJson()" factory constructor then,
        //append all to "allPost" list using .add() ;  a dart's List built-in method.

        allPost.add(PostModel.fromJson(eachPost));
      }
    }
    return allPost;
  }
}

```


