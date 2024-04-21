import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore/main.dart';
import 'package:fakestore/view/ui/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/colors.dart';
import '../../model/products/products.dart';
import '../../widgets/favourite_heart.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 20,
        ),
        itemCount: favouritesItems.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCard(favouritesItems[index], context);
        },
      ),
    );
  }

  Widget _buildCard(
    Product item,
    BuildContext context,
  ) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: FSColors.cardColor,
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              top: 15,
              bottom: 15,
              left: 25,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: double.maxFinite,
                    height: 130.0,
                    fit: BoxFit.scaleDown,
                    imageUrl: item.image!,
                    placeholder: (context, url) => SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgress(
                        width: 10,
                        height: 10,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/sinimagen.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 5,
              left: 170,
              child: SizedBox(
                width: double.minPositive,
                child: Text(
                  item.title!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Positioned(
              top: 155,
              right: 5,
              left: 170,
              child: SizedBox(
                width: double.minPositive,
                child: Text(
                  '\$ ${item.price.toString()}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
            Positioned(
              top: 140,
              right: 5,
              child: OutlinedButton(
                onPressed: () => Get.toNamed('/detail_product',
                    arguments: {'id': '${item.id}', 'product': item}),
                child: Text(
                  'Buy',
                  style: const TextStyle().copyWith(
                    color: FSColors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: FavourtireHeart(
                item: item,
                isFromFav: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
