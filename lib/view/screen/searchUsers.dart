import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widget/home/customappBar.dart';
import '../widget/home/listItemSearch.dart';

class SearchUsers extends StatelessWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: GetBuilder<HomeControllerImp>(
        builder: (controller) =>
            Container(
              child:
              Column(

                children: [
                  CustomAppBar1(),
Expanded(child: ListItemsSearch())

                ],
              ),
            ),
      ),
    );
  }}

