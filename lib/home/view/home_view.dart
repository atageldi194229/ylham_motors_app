import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/network_error/network_error.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeContent(),
    );
  }
}
