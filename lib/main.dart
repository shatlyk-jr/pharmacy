import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharmacy_only/pills.dart';

import 'infos.dart';
import 'pill_grid.dart';

void main() => runApp(Pharmacy());

class Pharmacy extends StatefulWidget {
  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  bool isLoad = false;

  Future<void> onCLick() async {
    setState(() {
      isLoad = true;
    });
    pillList.shuffle();
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Pharmacy',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900]!.withOpacity(.5),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          centerTitle: true,
          title: const Text('DERMANHANA'),
        ),
        body: RefreshIndicator(
          onRefresh: () => onCLick(),
          child: isLoad
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Pills(),
        ),
      ),
    );
  }
}
