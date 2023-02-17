import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BasicApiCall extends StatefulWidget {
  const BasicApiCall({Key? key}) : super(key: key);

  @override
  State<BasicApiCall> createState() => _BasicApiCallState();
}

class _BasicApiCallState extends State<BasicApiCall> {

  var tag = "BasicApiCall";
  double sizeBoxHeight = 15;

  var callApi = "call api";

  List<UserCoinPaprikaData> dataList = [];
  List<Tags> tagsList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar
          (title: Text(tag)),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: sizeBoxHeight,),
              ElevatedButton(
                  onPressed: () {
                    getBitCoinData();
                  },
                  child: Text(callApi)),
              SizedBox(height: sizeBoxHeight,),
              ListView.builder(
                itemCount: tagsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                      child: Text("${tagsList[index].name}"));
              },)

            ],
          ),
        ),
      ),
    );
  }

  getBitCoinData() async {

    var url = "https://api.coinpaprika.com/v1/coins/btc-bitcoin";
    var response = await http.get(Uri.parse(url));

    debugPrint("response.body: ${response.body}");

    var data = UserCoinPaprikaData.fromJson(jsonDecode(response.body));

    setState(() {
      dataList.add(data);
      for (var item in data.tags!) {
        tagsList.add(item);
      }
    });

    debugPrint("list size: ${dataList.length}");

  }
}

class UserCoinPaprikaData {
  String? id;
  String? name;
  String? symbol;
  int? rank;
  bool? isNew;
  bool? isActive;
  String? type;
  String? logo;
  List<Tags>? tags;
  List<Team>? team;
  String? description;
  String? message;
  bool? openSource;
  String? startedAt;
  String? developmentStatus;
  bool? hardwareWallet;
  String? proofType;
  String? orgStructure;
  String? hashAlgorithm;
  Links? links;
  List<LinksExtended>? linksExtended;
  Whitepaper? whitepaper;
  String? firstDataAt;
  String? lastDataAt;

  UserCoinPaprikaData(
      {this.id,
      this.name,
      this.symbol,
      this.rank,
      this.isNew,
      this.isActive,
      this.type,
      this.logo,
      this.tags,
      this.team,
      this.description,
      this.message,
      this.openSource,
      this.startedAt,
      this.developmentStatus,
      this.hardwareWallet,
      this.proofType,
      this.orgStructure,
      this.hashAlgorithm,
      this.links,
      this.linksExtended,
      this.whitepaper,
      this.firstDataAt,
      this.lastDataAt});

  UserCoinPaprikaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    rank = json['rank'];
    isNew = json['is_new'];
    isActive = json['is_active'];
    type = json['type'];
    logo = json['logo'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    if (json['team'] != null) {
      team = <Team>[];
      json['team'].forEach((v) {
        team!.add(new Team.fromJson(v));
      });
    }
    description = json['description'];
    message = json['message'];
    openSource = json['open_source'];
    startedAt = json['started_at'];
    developmentStatus = json['development_status'];
    hardwareWallet = json['hardware_wallet'];
    proofType = json['proof_type'];
    orgStructure = json['org_structure'];
    hashAlgorithm = json['hash_algorithm'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    if (json['links_extended'] != null) {
      linksExtended = <LinksExtended>[];
      json['links_extended'].forEach((v) {
        linksExtended!.add(new LinksExtended.fromJson(v));
      });
    }
    whitepaper = json['whitepaper'] != null
        ? new Whitepaper.fromJson(json['whitepaper'])
        : null;
    firstDataAt = json['first_data_at'];
    lastDataAt = json['last_data_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['rank'] = this.rank;
    data['is_new'] = this.isNew;
    data['is_active'] = this.isActive;
    data['type'] = this.type;
    data['logo'] = this.logo;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.team != null) {
      data['team'] = this.team!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['message'] = this.message;
    data['open_source'] = this.openSource;
    data['started_at'] = this.startedAt;
    data['development_status'] = this.developmentStatus;
    data['hardware_wallet'] = this.hardwareWallet;
    data['proof_type'] = this.proofType;
    data['org_structure'] = this.orgStructure;
    data['hash_algorithm'] = this.hashAlgorithm;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.linksExtended != null) {
      data['links_extended'] =
          this.linksExtended!.map((v) => v.toJson()).toList();
    }
    if (this.whitepaper != null) {
      data['whitepaper'] = this.whitepaper!.toJson();
    }
    data['first_data_at'] = this.firstDataAt;
    data['last_data_at'] = this.lastDataAt;
    return data;
  }
}

class Tags {
  String? id;
  String? name;
  int? coinCounter;
  int? icoCounter;

  Tags({this.id, this.name, this.coinCounter, this.icoCounter});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coinCounter = json['coin_counter'];
    icoCounter = json['ico_counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['coin_counter'] = this.coinCounter;
    data['ico_counter'] = this.icoCounter;
    return data;
  }
}

class Team {
  String? id;
  String? name;
  String? position;

  Team({this.id, this.name, this.position});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}

class Links {
  List<String>? explorer;
  List<String>? facebook;
  List<String>? reddit;
  List<String>? sourceCode;
  List<String>? website;
  List<String>? youtube;

  Links(
      {this.explorer,
      this.facebook,
      this.reddit,
      this.sourceCode,
      this.website,
      this.youtube});

  Links.fromJson(Map<String, dynamic> json) {
    explorer = json['explorer'].cast<String>();
    facebook = json['facebook'].cast<String>();
    reddit = json['reddit'].cast<String>();
    sourceCode = json['source_code'].cast<String>();
    website = json['website'].cast<String>();
    youtube = json['youtube'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['explorer'] = this.explorer;
    data['facebook'] = this.facebook;
    data['reddit'] = this.reddit;
    data['source_code'] = this.sourceCode;
    data['website'] = this.website;
    data['youtube'] = this.youtube;
    return data;
  }
}

class LinksExtended {
  String? url;
  String? type;
  Stats? stats;

  LinksExtended({this.url, this.type, this.stats});

  LinksExtended.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    return data;
  }
}

class Stats {
  int? subscribers;
  int? contributors;
  int? stars;
  int? followers;

  Stats({this.subscribers, this.contributors, this.stars, this.followers});

  Stats.fromJson(Map<String, dynamic> json) {
    subscribers = json['subscribers'];
    contributors = json['contributors'];
    stars = json['stars'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscribers'] = this.subscribers;
    data['contributors'] = this.contributors;
    data['stars'] = this.stars;
    data['followers'] = this.followers;
    return data;
  }
}

class Whitepaper {
  String? link;
  String? thumbnail;

  Whitepaper({this.link, this.thumbnail});

  Whitepaper.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
