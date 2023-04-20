import 'package:flutter/material.dart';

import 'pill_details.dart';
import 'pills.dart';

class Pills extends StatelessWidget {
  const Pills({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 8, right: 8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.5,
        ),
        itemCount: pillList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return PillDetails(
                  inf: pillList[index]['inf'],
                  foodName: pillList[index]['name'],
                  foodPrice: "${pillList[index]['price']} TMT",
                  heroTag: pillList[index]['img'],
                );
              },
            ),
          ),
          child: Card(
            color: Colors.white.withOpacity(.7),
            margin: const EdgeInsets.all(8),
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            elevation: 8,
            child: GridTile(
              footer: Card(
                margin: const EdgeInsets.all(0),
                color: Colors.black.withOpacity(.7),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          pillList[index]['name'],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white, fontFamily: 'Monsterrat'),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.red,
                      thickness: 1,
                      height: 3,
                    ),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: pillList[index]['img'],
                        child: Image.asset(
                          pillList[index]['img'],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
