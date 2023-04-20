// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_only/infos.dart';
import 'package:pharmacy_only/pills.dart';

class PillDetails extends StatefulWidget {
  final heroTag;
  final foodName;
  final String foodPrice;
  final String inf;

  PillDetails({this.heroTag, this.foodName, required this.foodPrice, required this.inf});

  @override
  _PillDetailsState createState() => _PillDetailsState();
}

class _PillDetailsState extends State<PillDetails> {
  var selectedCard = 'WEIGHT';

  int piece = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(pillList.length);
    print(inf.length);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 16, 20),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        elevation: 0.0,
        title: const Text(
          'Maglumatlar',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[700],
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.heroTag,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.white.withOpacity(.7),
                  ],
                ),
              ),
              height: size.height / 4,
              width: size.width,
              child: Image.asset(widget.heroTag),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                widget.foodName,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // const SizedBox(height: 5.0),
          const Divider(
            height: 10,
            color: Colors.white,
            thickness: 1,
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTileCard(
                    expandedColor: Colors.blueGrey[800],
                    expandedTextColor: Colors.amber,
                    baseColor: const Color.fromARGB(255, 222, 222, 222),
                    title: const Text(
                      'Doly Maglumat:',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              widget.inf,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18, fontFamily: 'Roboto', color: Colors.amberAccent),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
