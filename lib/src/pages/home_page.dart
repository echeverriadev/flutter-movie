import 'package:flutter/material.dart';
import 'package:flutter_movie/src/providers/peliculas_provider.dart';
import 'package:flutter_movie/src/widgets/card_swiper_widget.dart';
import 'package:flutter_movie/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: false,
        title: Text("Movies"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[ 
          IconButton( 
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[ 
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      )
    );
  }

  Widget _swiperTarjetas(){

  return FutureBuilder(
    future: peliculasProvider.getEnCines(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if(snapshot.hasData){
        return CardSwiper(
          peliculas: snapshot.data,
        );
      }else {
        return Container(
          height: 400.0,
          child: Center(
            child: CircularProgressIndicator()
          )
        );
      }
      
    },
  );

  }


  Widget _footer(BuildContext context){
    return Container( 
      width: double.infinity,
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:20.0),
            child: Text("Populares" , style: Theme.of(context).textTheme.bodyText1,)),
          SizedBox(height: 8.0,),
          FutureBuilder(
            future: peliculasProvider.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return MovieHorizontal(peliculas: snapshot.data);
              }else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}