import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _ImagenFondo(),
          _TextoTitulo(),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.4),
                      itemCount: 150,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: InkWell(
                            child: SafeArea(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: Colors.greenAccent),
                                child: Stack(
                                  children: [
                                    _PokeballInterno(),
                                    _ImagenPokemon(),
                                    _NombrePokemon(),
                                    _TipoPokemon()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _ImagenFondo() {
    return Positioned(
      top: -50,
      right: -50,
      child: Image.asset(
        'images/pokebola.png',
        fit: BoxFit.fitWidth,
        width: 200,
        color: const Color.fromARGB(255, 213, 213, 213),
      ),
    );
  }

  Widget _TextoTitulo() {
    return Positioned(
      top: 100,
      left: 20,
      child: Text(
        'Pokedex',
        style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 30),
      ),
    );
  }
}

Widget _PokeballInterno() {
  return Positioned(
    bottom: -40,
    right: -10,
    child: Image.asset(
      'images/pokebola.png',
      height: 100,
      fit: BoxFit.fitHeight,
    ),
  );
}

Widget _ImagenPokemon() {
  return Positioned(
    bottom: 5,
    right: 5,
    child: CachedNetworkImage(
      imageUrl: 'http://www.serebii.net/pokemongo/pokemon/094.png',
      height: 80,
      fit: BoxFit.fitHeight,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

Widget _NombrePokemon() {
  return const Positioned(
    top: 30,
    left: 15,
    child: Text(
      "Gengar",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
    ),
  );
}

Widget _TipoPokemon() {
  return Positioned(
    top: 55,
    left: 15,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Text(
          'Ghost',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.black.withOpacity(0.5),
      ),
    ),
  );
}
