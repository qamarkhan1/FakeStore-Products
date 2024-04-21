import 'package:fakestore/main.dart';
import 'package:fakestore/services/sharedprefs_service.dart';
import 'package:fakestore/view/home/home_page.dart';
import 'package:flutter/material.dart';

import '../model/products/products.dart';

class FavourtireHeart extends StatefulWidget {
  const FavourtireHeart(
      {required this.item, required this.isFromFav, super.key});
  final Product item;
  final bool isFromFav;
  @override
  State<FavourtireHeart> createState() => _FavourtireHeartState();
}

class _FavourtireHeartState extends State<FavourtireHeart> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (added) {
          added = false;
          int? itemIndex = favouritesItems.indexWhere(
            (e) => e.id == widget.item.id,
          );
          favouritesItems.removeAt(itemIndex);

          SharedPrefService().saveList(favouritesItems);
          if (widget.isFromFav) {
            refetchContext?.refetch();
          }
        } else {
          added = true;
          favouritesItems.add(widget.item);
          SharedPrefService().saveList(favouritesItems);
        }
        setState(() {});
      },
      icon: Icon(
        added ? Icons.favorite : Icons.favorite_outline_outlined,
      ),
    );
  }

  bool added = false;
  @override
  void initState() {
    added = favouritesItems.any((e) => e.id == widget.item.id);
    super.initState();
  }
}
