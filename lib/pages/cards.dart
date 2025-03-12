import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../data/movie_data.dart';

class Cards extends StatelessWidget {
  const Cards({super.key,required this.model});
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        Navigator.pushNamed(
          context,
          '/MovieDetail',
          arguments: model,  
        );
      
      },
      child: Card(
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
    
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Image.network(model.imgUrl,height: 200,width: 200,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
 Text(model.title),
 Text("(${model.year})"),
                          ],
                        ),
                       
                        Text(model.genre),
                        Row(
                          children: [
                            Icon(Icons.star_border),
                            Text("${model.rating}/10")
                          ]
                        

                        ),
                       
                        
                      ],
                      
                    ), 
                   
                    FavoriteButton(),
                                ],
                    
                  ),
                ]
              ),
             ),
          ],
        ),
      ),
    );
    
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.bookmark : Icons.bookmark,
        color: isFavorite ? Colors.blue : Colors.grey,
      ),
      iconSize: 30,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}