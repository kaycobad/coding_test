import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrendingSellerAndNewShopItem extends StatelessWidget {
  final String sellerItemPhoto;
  final String sellerProfilePhoto;
  final String sellerName;

  const TrendingSellerAndNewShopItem({
    required this.sellerItemPhoto,
    required this.sellerProfilePhoto,
    required this.sellerName,
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
      elevation: 0,
      child: Container(
        width: 105,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: sellerItemPhoto,
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
            Positioned(
              top: 7,
              left: 7,
              child: CachedNetworkImage(
                height: 30,
                width: 30,
                imageUrl: sellerProfilePhoto,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                ),
                child: Text(
                  sellerName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
