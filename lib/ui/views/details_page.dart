import 'package:flutter/material.dart';
import 'package:netflix_clone/data/entity/films.dart';
import 'package:netflix_clone/ui/colors/colors.dart';

class DetailPage extends StatefulWidget {
  final Films film;

  DetailPage({required this.film});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(widget.film.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: mainRed,
      ),
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/${widget.film.image}"),
            Center(
              child: Text(
                widget.film.description,
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "${widget.film.time} min",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
