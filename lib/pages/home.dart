import 'package:flutter/material.dart';

import '/model/post_model.dart';
import '/services/network/http_service.dart';
import '/widgets/custom_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpService httpService = HttpService();
  late Future<List<PostModel>> getHttpServiceData;

  @override
  void initState() {
    getHttpServiceData = httpService.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text('App'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Device',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    'width :  ${deviceSize.width.toString()}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'height :  ${deviceSize.height.toString()}',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<PostModel>>(
        //use "getHttpServiceData" and replace "httpService.getData(),"
        future: getHttpServiceData,
        builder: (context, AsyncSnapshot snapshot) {
          //show progressBar if data not ready
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 100,
                child: LinearProgressIndicator(),
              ),
            );

            //display error message on screen if request failed
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );

            //otherwise display all fetchedd data below
          } else {
            //create an object to reference the snapshot.data list
            List<PostModel> postList = snapshot.data;

            return ListView.builder(
              itemCount: postList.length, //same as httpService.allPost.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  postNo: '${index + 1}',
                  messageTitle: postList[index].title.toUpperCase(),
                  authorID: 'by User-Nọ: ${postList[index].userID}',
                  messageBody: postList[index].body,
                );
              },
            );
          }
        },
      ),
    );
  }
}
