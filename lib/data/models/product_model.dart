class ProductModel {
  ProductModel({
    this.storyTime,
    this.story,
    this.storyType,
    this.storyImage,
    this.storyAdditionalImages,
    this.promoImage,
    this.orderQty,
    this.lastAddToCart,
    this.availableStock,
    this.myId,
    this.ezShopName,
    this.companyName,
    this.companyLogo,
    this.companyEmail,
    this.currencyCode,
    this.unitPrice,
    this.discountAmount,
    this.discountPercent,
    this.iMyId,
    this.shopName,
    this.shopLogo,
    this.shopLink,
    this.friendlyTimeDiff,
    this.slNo,
  });

  final DateTime? storyTime;
  final String? story;
  final String? storyType;
  final String? storyImage;
  final String? storyAdditionalImages;
  final String? promoImage;
  final int? orderQty;
  final DateTime? lastAddToCart;
  final int? availableStock;
  final String? myId;
  final String? ezShopName;
  final String? companyName;
  final String? companyLogo;
  final String? companyEmail;
  final String? currencyCode;
  final int? unitPrice;
  final int? discountAmount;
  final int? discountPercent;
  final String? iMyId;
  final String? shopName;
  final String? shopLogo;
  final String? shopLink;
  final String? friendlyTimeDiff;
  final String? slNo;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        storyTime: DateTime.parse(json["storyTime"]),
        story: json["story"],
        storyType: json["storyType"],
        storyImage: json["storyImage"],
        storyAdditionalImages: json["storyAdditionalImages"],
        promoImage: json["promoImage"],
        orderQty: json["orderQty"],
        lastAddToCart: DateTime.parse(json["lastAddToCart"]),
        availableStock: json["availableStock"],
        myId: json["myId"],
        ezShopName: json["ezShopName"],
        companyName: json["companyName"],
        companyLogo: json["companyLogo"],
        companyEmail: json["companyEmail"],
        currencyCode: json["currencyCode"],
        unitPrice: json["unitPrice"],
        discountAmount: json["discountAmount"],
        discountPercent: json["discountPercent"],
        iMyId: json["iMyID"],
        shopName: json["shopName"],
        shopLogo: json["shopLogo"],
        shopLink: json["shopLink"],
        friendlyTimeDiff: json["friendlyTimeDiff"],
        slNo: json["slNo"],
      );
}
