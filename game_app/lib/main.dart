import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: GodofWar(),
    ),
  );
}

class GodofWar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("God of War"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 50,
                      ),
                      child: Column(
                        children: <Widget>[
                          imageload(40, 160, 85,
                              'http://ggk.gildia.pl/wp-content/uploads/2018/05/gow-740x389.jpg')
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                              "God of War 2018",
                              style: TextStyle(fontSize: 15),
                            )),
                        StarsRow(5)
                      ],
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 30, left: 7, right: 7, bottom: 7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.grey,
                              spreadRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 20, left: 40, right: 40, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              imageload(30, 500, 250,
                                  'http://ggk.gildia.pl/wp-content/uploads/2018/05/gow-740x389.jpg')
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StarsRow(5),
                              TextButton(
                                onPressed: () {
                                  print("Like");
                                },
                                child: Text("Like"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          child: Text(
                            "God of War to przygodowa gra akcji z otwartym ??wiatem przedstawiona z perspektywy trzeciej osoby, w kt??rej gracz steruje Kratosem. W por??wnaniu do poprzednich  cz????ci serii zmienionych zosta??o kilka element??w mechaniki gry. W tej cz????ci kamera jest umiejscowiona bli??ej g??owy i plec??w Kratosa ??? podobnie jak w serii Uncharted. Kratos zamiast ostrzy przymocowanych do ??a??cuch??w teraz pos??uguje si?? toporem, kt??ry po rzuceniu wraca do bohatera. Bro?? mo??na ulepsza?? przy pomocy magicznych run. Poziomy gry oferuj?? wi??cej swobody eksploracji i znajduje si?? w nich wielu r????nych przeciwnik??w (w tym boss??w) i znajdziek. W grze zrezygnowano z sekwencji quick time event. Ponadto nad g??owami boss??w wy??wietlane s?? dwa paski ??? pierwszy informuje o liczbie punkt??w ??ycia przeciwnika, a drugi o stopniu oszo??omienia wroga.  Kratosowi w walce pomaga jego syn Atreus, kt??remu gracz mo??e wydawa?? polecenia. Zar??wno Kratos,  jak i jego potomek, zdobywaj??  do??wiadczenie oraz umiej??tno??ci w trakcie gry.\n ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Roboto"),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
    );
  }
}

class StarsRow extends StatelessWidget {
  final int rating;

  const StarsRow(
      this.rating, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return Row(children: stars);
  }
}

class imageload extends StatelessWidget {
  final double txt;
  final double txt1;
  final double txt2;
  final String image;

  const imageload(
      this.txt,
      this.txt1,
      this.txt2,
      this.image, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return ClipRRect(
      borderRadius: BorderRadius.circular(txt),
      child: Image.network(
        (image),
        width: txt1,
        height: txt2,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}

