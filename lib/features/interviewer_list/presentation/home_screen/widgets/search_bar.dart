import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((10)),
          color: ColorConstants.kGrey,
          boxShadow: const [
            BoxShadow(
              color: ColorConstants.kShadowColor,
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 5),
            )
          ]),
      child: ListTile(
        leading: SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Search Interviews',
                border: InputBorder.none,
              ),
            )),
        trailing: const Icon(Icons.search),
      ),
    );
  }
}
