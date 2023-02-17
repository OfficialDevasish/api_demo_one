
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_data_provider.dart';


class ApiCallUsingProvider extends StatefulWidget {
  const ApiCallUsingProvider({Key? key}) : super(key: key);

  @override
  State<ApiCallUsingProvider> createState() => _ApiCallUsingProviderState();
}

class _ApiCallUsingProviderState extends State<ApiCallUsingProvider> {
  var tag = "ApiCallUsingProvider";
  double sizeBoxHeight = 15;

  var callApi = "call api";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(tag),
        ),
        body: ChangeNotifierProvider<ApiDataProvider>(
          create: (context) => ApiDataProvider(),
          child: Consumer<ApiDataProvider>(
            builder: (context, value, child) {
              return Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeBoxHeight,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          value.getApiCoinPaprikaData();
                        },
                        child: Text(callApi)),
                    SizedBox(
                      height: sizeBoxHeight,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount:  value.list.length,
                      itemBuilder: (context, index) {
                        return Text(value.list[index].name!);
                      },)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
