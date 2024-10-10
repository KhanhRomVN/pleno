import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: child,
        bottomNavigationBar: const CustomBottomNavBar(),
        backgroundColor: Colors.white);
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green.shade300,
            Colors.blue.shade200,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _NavItem(icon: Icons.home, route: '/', index: 0),
          _NavItem(icon: Icons.post_add, route: '/social', index: 1),
          _NavItem(
            icon: Icons.swap_horiz,
            route: '',
            index: 2,
          ),
          _NavItem(icon: Icons.shopping_cart, route: '/cart', index: 3),
          _NavItem(icon: Icons.settings, route: '/setting', index: 4),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String route;
  final int index;
  final bool isSelected;

  const _NavItem({
    Key? key,
    required this.icon,
    required this.route,
    required this.index,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              shape: BoxShape.circle,
            )
          : null,
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected
              ? Colors.blue
              : Colors.black, // Changed to black for unselected
          size: 24, // Reduced size from 28 to 24
        ),
        onPressed: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
