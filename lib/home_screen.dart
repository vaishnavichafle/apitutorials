import 'package:apitutorials/example_two.dart';
import 'package:apitutorials/postdata_screen.dart';
import 'package:flutter/material.dart';
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers:[
            SliverAppBar(
              expandedHeight: 100,
              title: Text('API Testing',style:TextStyle(fontFamily: 'NanumMyeongjo',letterSpacing: 2.0,fontWeight: FontWeight.w900,color: Colors.white)),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[Colors.deepPurple,Colors.pink,Colors.deepOrange])
                ),
              ),),
            SliverList(delegate: SliverChildListDelegate([
              Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors:[Colors.green,Colors.lightGreen,Colors.lightGreenAccent])
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('WELCOME TO THE NEW WORLD OF DATA',textAlign: TextAlign.center,style:TextStyle(fontFamily: 'NanumMyeongjo',letterSpacing: 2.0,
                        fontWeight: FontWeight.w900,color: Colors.white,fontSize: 20)),
                  ),
                ),
              ),
              Container(
                height: 300,
              child: Center(
                child: ElevatedButton(
                            onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                            builder: (context) => const MyPostDataScreen()),);},
                child: Text('Show Data'),),
              ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors:[Colors.deepPurple,Colors.pink,Colors.deepOrange])
                ),
              ),
              Container(
                height: 300,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context) => const ExampleTwo()),);},
                    child: Text('Show Data 2'),),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors:[Colors.deepPurple,Colors.pink,Colors.deepOrange])
                ),
              )
            ]),)
          ]
      ),
    );
  }
}
