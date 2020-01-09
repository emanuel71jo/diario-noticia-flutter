
import 'package:diario_noticias/noticia_controller.dart';
import 'package:diario_noticias/web_view_noticia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _HomePageState(){
    controller.pesquisar(search: null, indexCategory: 0);
  }

  final controller = GetIt.I.get<ControllerNoticias>();
  final textController = TextEditingController();

  List<String> categorias = [
    "Principais",
    "Negócios",
    "Entretenimento",
    "Saúde",
    "Ciência",
    "Esporte",
    "Tecnologia"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBackGround(),
          Column(
            children: <Widget>[
              _buildTopBar(),
              SizedBox(height: 16,),
              _buildListCategory(),
              Observer(
                builder: (_) => controller.loading 
                ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(child: LinearProgressIndicator(),),
                )
                : controller.noticias.isEmpty
                  ? Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Nenhuma notícia encontrado",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.w100
                      ),
                    ),
                  )
                  : _buildListBody(),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildListBody(){
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 30,),
        padding: EdgeInsets.all(25),
        itemCount: controller.noticias.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => WebViewNoticia(controller.noticias[index]))
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(5)
                ),
                image: DecorationImage(
                  image: controller.noticias[index].urlImage == null
                  ? NetworkImage("https://img.utdstc.com/icons/google-icons-android.png:l")
                  : NetworkImage(controller.noticias[index].urlImage),
                  fit: BoxFit.fill
                ),
              ),

              height: MediaQuery.of(context).size.height / 2.2,
              child: Stack(
                children: <Widget>[
                  !controller.search 
                  ? Container() :
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.red, Colors.pinkAccent]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      categorias[controller.getIndex],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[100].withAlpha(80),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            controller.noticias[index].title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.6),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(30)
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            controller.noticias[index].description,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildListCategory(){
    return SizedBox(
      height: 60,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 30, right: 30),
        separatorBuilder: (context, index) => Container(width: 50,),
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (context, index){
          return Observer(
            builder: (_) => InkWell(
              onTap: (){
                controller.setIndex(index);
              },
              child: Text(
                categorias[index],
                style: TextStyle(
                  letterSpacing: 5,
                  color: Colors.white,
                  fontSize: controller.getIndex == index ? 35 : 30,
                  fontWeight: controller.getIndex == index ? FontWeight.bold : FontWeight.normal
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildTopBar(){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              child: const Icon(Icons.person, color: Colors.white,),
            ),
            SizedBox(width: 8,),
            Expanded(
              child: TextField(
                onSubmitted: (text){
                  if(textController.text.isNotEmpty){
                    controller.pesquisar(
                      search: textController.text
                    );
                    textController.text = "";
                  }
                },
                controller: textController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.grey, width: 2)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  hintText: "Pesquisar noticias",
                  hintStyle: TextStyle(
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 8,),
            IconButton(
              padding: EdgeInsets.only(right: 8),
              alignment: Alignment.center,
              icon: Icon(Icons.search, color: Colors.white,),
              onPressed: (){
                if(textController.text.isNotEmpty){
                  controller.pesquisar(
                    search: textController.text
                  );
                  textController.text = "";
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _buildBackGround(){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black, Colors.blueAccent],
          tileMode: TileMode.mirror
        ),
      ),
    );
  }
}