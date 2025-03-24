import 'package:benta/core/utils/app_router.dart';
import 'package:benta/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<IconData> icons = [
    Icons.home,
    Icons.favorite_border,
    Icons.shopping_cart_outlined,
    Icons.local_shipping_outlined,
    Icons.person_outline,
  ];

  final List<String> labels = [
    "Home",
    "Favourite",
    "Cart",
    "Order tracking",
    "Profile",
  ];
  int getSelectedIndex(BuildContext context) {
    final GoRouterState routerState = GoRouterState.of(context);
    final String location = routerState.uri.toString();

    if (location == AppRouter.kHomeView) return 0;
    if (location == AppRouter.kFavouriteView) return 1;
    if (location == AppRouter.kMyCartView) return 2;
    if (location == AppRouter.kOrderView) return 3;
    if (location == AppRouter.kProfileView) return 4;
    return 0;
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.push(AppRouter.kHomeView);
        break;
      case 1:
        context.push(AppRouter.kFavouriteView);
        break;
      case 2:
        context.push(AppRouter.kMyCartView);
        break;
      case 3:
        context.push(AppRouter.kOrderView);
        break;
      case 4:
        context.push(AppRouter.kProfileView);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = getSelectedIndex(context);
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kLightGreyColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) {
        onItemTapped(context, index);
      },
      items: List.generate(icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(icons[index]),
          label: labels[index],
        );
      }),
    );
  }
}
