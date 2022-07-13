// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String postNo;
  final String authorID;
  final String messageTitle;
  final String messageBody;

  const CustomCard({
    Key? key,
    required this.postNo,
    required this.authorID,
    required this.messageTitle,
    required this.messageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width * 0.7,
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: Row(
        children: [
          //section for author avater
          Container(
            color: Colors.teal,
            width: deviceSize.width * 0.4,
            height: double.infinity,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  Text(
                    'Post-Nọ :',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    postNo,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[100],
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xff880e47),
                shape: BoxShape.circle,
              ),
            ),
          ),

          //section for post content
          Flexible(
            child: Container(
              color: Colors.amber,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    messageTitle,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    authorID,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: Text(
                      messageBody,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.pink,
        border: Border.all(color: Colors.white, width: 5.0),
      ),
    );
  }
}
