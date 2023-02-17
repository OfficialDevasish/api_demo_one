import 'package:api_demo_one/1_basic_api/basic_api_call.dart';
import 'package:api_demo_one/3_api_with_pagination/api_with_pagination.dart';
import 'package:api_demo_one/5_my_api_get_cat/my_api_get_cat.dart';
import 'package:api_demo_one/5_my_api_get_cat/my_cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '2_api_call_using_provider/api_call_using_provider.dart';
import '4_my_api_with_pagination/my_api_with_pagination.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<MyCatProvider>(create: (context) =>MyCatProvider())]
          , child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MyApp()))
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var tag = "MyAppDemo";
  double sizeBoxHeight = 15;

  var basicApiCall = "basic api call";
  var apiCallUsingProvider = "api call using provider";
  var apiCallUsingPagination = "api call using pagination";
  var myApiCallUsingPagination = "My api call using pagination";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tag),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: sizeBoxHeight,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BasicApiCall(),
                      ));
                },
                child: Text(basicApiCall)),
            SizedBox(height: sizeBoxHeight,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApiCallUsingProvider(),
                      ));
                },
                child: Text(apiCallUsingProvider)),

            SizedBox(height: sizeBoxHeight,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApiWithPagination(),
                      ));
                },
                child: Text(apiCallUsingPagination)),

            SizedBox(height: sizeBoxHeight,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyApiWithPagination(),
                      ));
                },
                child: Text(myApiCallUsingPagination)),


            SizedBox(height: sizeBoxHeight,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApiGetCat(),
                      ));
                },
                child: Text("My cat api call")),
          ],
        ),
      ),
    );
  }
}
