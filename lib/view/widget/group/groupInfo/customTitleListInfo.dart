import 'package:flutter/material.dart';

class CustomListTileInfo extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String text;

  const CustomListTileInfo({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: size.width / 22,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}