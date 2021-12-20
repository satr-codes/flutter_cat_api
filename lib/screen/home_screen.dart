import 'package:flutter/material.dart';
import 'package:flutter_cat/api/cat_api.dart';
import 'package:flutter_cat/model/cat_image.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<CatImage> catImage;
  @override
  void initState() {
    super.initState();
    setState(() {
      catImage = CatApi.getNewCat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Api"),
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 200,
        onRefresh: () async {
          setState(() {
            catImage = CatApi.getNewCat();
          });
        },
        child: ListView(
          children: [
            FutureBuilder(
              future: catImage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CatImage catData = snapshot.data as CatImage;
                  return Image.network(
                    catData.url,
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                }
                return Center(
                  child: LinearProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
