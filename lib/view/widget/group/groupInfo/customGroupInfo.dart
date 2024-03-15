import 'package:flutter/material.dart';

class CustomGroupInfo extends StatelessWidget {
  final String groupName;

  const CustomGroupInfo({required this.groupName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 8,
      width: size.width / 1.1,
      child: Row(
        children: [
          Container(
            height: size.height / 11,
            width: size.height / 11,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Icon(
              Icons.group,
              color: Colors.white,
              size: size.width / 10,
            ),
          ),
          SizedBox(
            width: size.width / 20,
          ),
          Expanded(
            child: Container(
              child: Text(
                groupName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: size.width / 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}