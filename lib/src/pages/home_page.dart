import 'package:flutter/material.dart';
import 'package:flutter_movie/src/providers/peliculas_provider.dart';
import 'package:flutter_movie/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {

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
          children: <Widget>[ 
            _widgetTarjetas()
          ],
        ),
      )
    );
  }

Widget _widgetTarjetas(){

  final peliculasProvider = new PeliculasProvider();
  peliculasProvider.getEnCines();

  return CardSwiper(
    peliculas: [1,2,3,4,5],
  );
  }
}