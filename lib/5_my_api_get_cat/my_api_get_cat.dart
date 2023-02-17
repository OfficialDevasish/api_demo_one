import 'package:api_demo_one/5_my_api_get_cat/my_cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApiGetCat extends StatefulWidget {
  const MyApiGetCat({Key? key}) : super(key: key);

  @override
  State<MyApiGetCat> createState() => _MyApiGetCatState();
}

class _MyApiGetCatState extends State<MyApiGetCat> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MyCatProvider>(context, listen: false).getCategory();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("get cat")),
        body: ChangeNotifierProvider<MyCatProvider>(
          create: (_) => MyCatProvider(),
          child: Consumer<MyCatProvider>(builder: (context, value, child) {
            var data= value.categoriesResponse.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Text(data[index].title.toString());
              });
          }
          ),
        ),
      ),
    );
  }
}
