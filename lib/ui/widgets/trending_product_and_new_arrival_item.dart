import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingProductAndNewArrivalItem extends StatelessWidget {
  final String productImage;
  final String productName;
  final String shortDetails;

  const TrendingProductAndNewArrivalItem({
    required this.productImage,
    required this.productName,
    required this.shortDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      elevation: 2,
      child: Container(
        width: 105,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: productImage,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     Colors.red, BlendMode.colorBurn),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: SizedBox(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    shortDetails,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
