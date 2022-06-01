import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

class MyMainPage extends StatelessWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      home: Scaffold(
          body: Column(
        children: const <Widget>[
          MovieList(),
        ],
      )),
    );
  }
}

class MovieCard extends StatelessWidget {
  final movie;
  const MovieCard(this.movie, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: () {
          //   Navigator.of(context)
          //       .push(MaterialPageRoute(builder: (context) => DetailsPage()));
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
            
                        child:
                      Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie['poster_path']}",
                    
                    fit: BoxFit.fill,
              
                    ),),
                      // Text(movie['title'].toString(),
                    
                      //     style: const TextStyle(
                      //         fontSize: 21, fontWeight: FontWeight.bold)),
                      // const SizedBox(height: 10),
                      // Row(
                      //   children: const [
                      //     Text(
                      //       'Released:',
                      //       textAlign: TextAlign.right,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      //       child: Text(
                      //         'Imdb:',
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //         height: 25, child: Text(movie['release_date'])),
                      //     Padding(
                      //       padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      //       child: SizedBox(
                      //           height: 25,
                      //           child: Text(
                      //             movie['vote_average'].toString(),
                      //           )),
                      //     ),
                      //   ],
                      // ),
                      // Expanded(child: Text(movie['overview']))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<Map> getJson() async {
  var url =
      "http://api.themoviedb.org/3/discover/movie?api_key=92f641baf30ecb2af1f8044fe04de4c4";
  http.Response response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  var movies;

  Future<void> getData() async {
    try {
      var data = await getJson();
      setState(() {
        movies = data['results'];
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Expanded(
      child: ListView.builder(
          itemCount: movies == null ? 0 : movies.length,
          itemBuilder: (context, i) => MovieCard(movies[i])),
    );
  }
}