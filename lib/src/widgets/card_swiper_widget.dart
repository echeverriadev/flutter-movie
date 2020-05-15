import 'package:flutter/material.dart';
import 'package:flutter_movie/src/models/pelicula_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;
  CardSwiper({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
    padding: EdgeInsets.only(top: 10.0),
    child: Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: _screenSize.width *0.7,
      itemHeight: _screenSize.height * 0.55,     
      itemBuilder: (BuildContext context,int index){
        return ClipRRect( 
          child: FadeInImage( 
            image: NetworkImage( peliculas[index].getPosterImg()),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(15.0),

        );
      },
      itemCount: peliculas.length,
      // pagination: new SwiperPagination(),
      // control: new SwiperControl(),
      ),
  );
  }
}