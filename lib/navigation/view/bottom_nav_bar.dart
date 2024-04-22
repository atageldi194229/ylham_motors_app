// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ylham_motors/app/app.dart';
import 'package:ylham_motors/cart/cart.dart';
import 'package:ylham_motors/categories/categories.dart';
import 'package:ylham_motors/home/home.dart';
import 'package:ylham_motors/masters/masters.dart';
import 'package:ylham_motors/profile/profile.dart';

enum BottomNavigationBarItemType {
  home,
  category,
  cart,
  orders,
  profile,
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  Map<BottomNavigationBarItemType, Widget> get pages => {
        BottomNavigationBarItemType.home: const HomePage(),
        BottomNavigationBarItemType.category: const CategoriesPage(),
        BottomNavigationBarItemType.cart: const CartPage(),
        BottomNavigationBarItemType.orders: const MastersPage(),
        BottomNavigationBarItemType.profile: const ProfilePage(),
      };

  Map<BottomNavigationBarItemType, BottomNavigationBarItem> get items => {
        BottomNavigationBarItemType.home: const BottomNavigationBarItem(
          activeIcon: Icon(Icons.home_rounded),
          icon: Icon(Icons.home_outlined),
          label: 'Baş sahypa',
        ),
        BottomNavigationBarItemType.category: const BottomNavigationBarItem(
          activeIcon: Icon(Icons.category_rounded),
          icon: Icon(Icons.category_outlined),
          label: 'Kategoriýa',
        ),
        BottomNavigationBarItemType.cart: const BottomNavigationBarItem(
          activeIcon: CartQuantityBadge(child: Icon(Icons.shopping_cart_rounded)),
          icon: CartQuantityBadge(child: Icon(Icons.shopping_cart_outlined)),
          label: 'Sebet',
        ),
        BottomNavigationBarItemType.orders: const BottomNavigationBarItem(
          activeIcon: Icon(Icons.favorite_rounded),
          icon: Icon(Icons.favorite_border_rounded),
          label: 'Halanlarym',
        ),
        BottomNavigationBarItemType.profile: const BottomNavigationBarItem(
          activeIcon: Icon(Icons.person_rounded),
          icon: Icon(Icons.person_outlined),
          label: 'Profil',
        ),
      };

  static final itemOrder = [
    BottomNavigationBarItemType.home,
    BottomNavigationBarItemType.category,
    BottomNavigationBarItemType.cart,
    BottomNavigationBarItemType.orders,
    BottomNavigationBarItemType.profile,
  ];

  @override
  Widget build(BuildContext context) {
    final currentType = context.select((AppCubit cubit) => cubit.state.currentBottomNavigationBarType);

    return Scaffold(
      body: pages[currentType],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: itemOrder.indexOf(currentType),
        onTap: (int index) {
          context.read<AppCubit>().updateAppBottomNavigationBarItemType(itemOrder[index]);
        },
        items: itemOrder.map<BottomNavigationBarItem>((e) => items[e]!).toList(),
      ),
    );
  }
}
