import 'package:flutter/material.dart';
import 'package:netflix_clone/data/entity/films.dart';
import 'package:netflix_clone/ui/colors/colors.dart';

class DetailPage extends StatefulWidget {

  Films film;

  DetailPage({required this.film});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Colors.white,),title: Text(widget.film.name, style: const TextStyle(color: Colors.white),),backgroundColor: mainRed,),
      backgroundColor: background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.film.image}"),
            Text("${widget.film.time} min", style: const TextStyle(fontSize: 50, color: Colors.white), )
          ],
        ),
      ),
    );
  }
}
