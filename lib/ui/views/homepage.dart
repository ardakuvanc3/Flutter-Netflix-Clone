import 'package:flutter/material.dart';
import 'package:netflix_clone/data/entity/films.dart';
import 'package:netflix_clone/ui/colors/colors.dart';
import 'package:netflix_clone/ui/views/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isSearch = false;

Future<void> search(String searchWord) async {
}

Future<List<Films>> uploadFilms() async {
  var filmList = <Films>[];
  var f1 = Films(id: 1, image: "django.png" , name:"Django" , time:165,description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" );
  var f2 = Films(id: 2, image: "inception.png" , name:"İnception" , time:148, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");
  var f3 = Films(id: 3, image: "interstellar.png" , name:"İnterstellar" , time:169, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" );
  var f4 = Films(id: 4, image: "thepianist.png" , name:"The Pianist" , time:150 , description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");
  var f5 = Films(id: 5, image: "thehatefuleight.png" , name:"The Hateful Eight" , time: 187, description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" );
  var f6 = Films(id: 6, image: "anadoluda.png" , name:"Anadoluda" , time:157 ,description:  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");

  filmList.add(f1);
  filmList.add(f2);
  filmList.add(f3);
  filmList.add(f4);
  filmList.add(f5);
  filmList.add(f6);
  return filmList;
}

class _HomePageState extends State<HomePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
        leading: const BackButton(color: Colors.white,),
        backgroundColor: mainRed,
        title: isSearch ?
      TextField(decoration: const InputDecoration(hintText: "Search Movie",hintStyle: TextStyle(color: Colors.white),),style: const TextStyle(color: Colors.white),
        onChanged: (searchResult) {
          search(searchResult);
        },
      ) :
      const Text("Netflix", style: TextStyle(color: Colors.white)),
        actions: [
          isSearch ?
          IconButton(onPressed: () {

            setState(() {
              isSearch = false;
            });

          }, icon: const Icon(Icons.clear, color: Colors.white,)) :
          IconButton(onPressed: () {
            setState(() {
              isSearch = true;
            });
          }, icon: const Icon(Icons.search, color: Colors.white,),)
        ],
      ),
      backgroundColor: background,
      body: FutureBuilder<List<Films>>(
        future: uploadFilms(),
        builder: (context, snapshop){
          if(snapshop.hasData){
            var filmList = snapshop.data;
            return ListView.builder(
              itemCount: filmList!.length,
              itemBuilder: (context, indeks) { //0,1,2,3,4,5,6
                var film = filmList[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailPage(film: film,)));
                  },
                  child: Card(
                    color: background,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox
                            (
                              width: 128, height: 128,
                              child: Image.asset("images/${film.image}")),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(film.name, style: const TextStyle(color: Colors.white),),
                              const SizedBox(height: 10),
                              Text("${film.time} min", style: const TextStyle(fontSize: 20, color: Colors.white),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: const Icon(Icons.play_circle),
                            color: Colors.white,
                            onPressed: () {
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
    );
  }
}
