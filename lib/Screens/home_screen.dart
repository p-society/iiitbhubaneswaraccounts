import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iiitbhubaneswaraccounts/Apis/entities.dart';
import 'package:iiitbhubaneswaraccounts/Screens/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF071952),
        centerTitle: true,
        foregroundColor: Colors.white,
        title: FutureBuilder(
          future: Entities.getTotal(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Text(
                "Total: ₹${jsonDecode(snapshot.data?["data"])["sum"].toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xFF35A29F),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: FutureBuilder(
            future: Entities.getEntitites(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                List<dynamic> entities = jsonDecode(snapshot.data?["data"]);
                return ListView.builder(
                  itemCount: entities.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: Colors.white,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            entities[index]["name"],
                          ),
                          Text(
                            entities[index]["weightage"].toString(),
                          ),
                          Text(
                            "₹ ${entities[index]["current_balance"].toStringAsFixed(2)}",
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
