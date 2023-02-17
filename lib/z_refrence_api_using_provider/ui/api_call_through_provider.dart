import 'package:flutter/material.dart';

class ApiCallThroughProvider extends StatefulWidget {
  const ApiCallThroughProvider({Key? key}) : super(key: key);

  @override
  State<ApiCallThroughProvider> createState() => _ApiCallThroughProviderState();
}

class _ApiCallThroughProviderState extends State<ApiCallThroughProvider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(title: Text("Api call through provider"),),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              ElevatedButton(onPressed: (){}, child: Text("")),


            ],
          ),
        ),
      ),
    );
  }
}
