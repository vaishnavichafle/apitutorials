import 'dart:convert';

import 'package:apitutorials/Models/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyPostDataScreen extends StatefulWidget {
  const MyPostDataScreen({super.key});

  @override
  State<MyPostDataScreen> createState() => _MyPostDataScreenState();
}

class _MyPostDataScreenState extends State<MyPostDataScreen> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi()async{
    final response = await http.get(Uri.parse('https://658e5ffb2871a9866e790fa4.mockapi.io/testttt/v1/employee'));
    var data =jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postList.clear();
      for(Map<String,dynamic> i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList ;
    }else {
      return postList ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan,
        elevation: 10,
        shadowColor: Colors.cyanAccent,
        title: Text('API Testing',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.5)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot){
                  if(!snapshot.hasData){
                    //return Text('Loading');
                    return Center(child: CircularProgressIndicator(color: Colors.green));
                  }else {
                    //return Center(child: CircularProgressIndicator(color: Colors.green));
                    return ListView.builder(
                      itemCount: postList.length,
                        itemBuilder: (context, index){
                      //return Text(index.toString());or
                      //return Text(postList[index].title.toString());or
                      return Card(color: Colors.amberAccent,elevation: 6.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height:5),
                                  Text('Name', style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                  Text(postList[index].name.toString(),style: TextStyle(fontWeight: FontWeight.w500),),
                                  Text('CreatedAt', style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                                  Text(postList[index].createdAt.toString()),
                                ],
                              ),
                              SizedBox(width:30),
                              Image.network(postList[index].avatar.toString()),
                            ],
                          ),
                        ),
                      );
                    });
                  }
                }),
          )
        ],
      ),
    );
  }
}
