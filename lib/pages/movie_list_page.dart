import 'package:flutter/material.dart';
import 'package:kuis_h/pages/button_wiki.dart';
import 'cards.dart';
import '../model/movie_model.dart';
import '../data/movie_data.dart';
import  'package:url_launcher/url_launcher.dart';
class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key,required this.model});
  final MovieModel model;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title), centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(model.imgUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(model.title),
                  SizedBox(width: 20,),
                  Text("(${model.year})"),
                ],),
                Text("Directed by ${model.director}"),
                Text(model.synopsis),
                Row(
                  children: [
                Text("Genre : "),
                Text(model.genre),
                  ],
                ),
                Row(
                  children: [
                Text("Casts : "),
                Text("${model.casts}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border),
                    SizedBox(width: 10,),
                    Text("Rated ${model.rating}/10")
                  ],
                ),
                SizedBox(height: 30,),
                ButtonWikipedia(movieUrl: model.movieUrl),
              ],
            ),
            ),
          ],
        ),
        
      ),
    );
  }
}
class MovieListPage extends StatelessWidget {
  final username;
  const MovieListPage({super.key,required this.username});

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(title: Text("Hello ${username}"),),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context,index) {
          return Cards(model: movieList[index],);
        },
      ),
    );
  }
}
