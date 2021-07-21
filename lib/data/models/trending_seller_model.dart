class TrendingSellerModel {
  TrendingSellerModel({
    this.slNo,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerItemPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.aboutCompany,
    this.allowCod,
    this.division,
    this.subDivision,
    this.city,
    this.state,
    this.zipcode,
    this.country,
    this.currencyCode,
    this.orderQty,
    this.orderAmount,
    this.salesQty,
    this.salesAmount,
    this.highestDiscountPercent,
    this.lastAddToCart,
    this.lastAddToCartThatSold,
  });

  final String? slNo;
  final String? sellerName;
  final String? sellerProfilePhoto;
  final String? sellerItemPhoto;
  final String? ezShopName;
  final double? defaultPushScore;
  final String? aboutCompany;
  final int? allowCod;
  final dynamic division;
  final dynamic subDivision;
  final String? city;
  final String? state;
  final String? zipcode;
  final String? country;
  final String? currencyCode;
  final int? orderQty;
  final int? orderAmount;
  final int? salesQty;
  final int? salesAmount;
  final int? highestDiscountPercent;
  final DateTime? lastAddToCart;
  final DateTime? lastAddToCartThatSold;

  factory TrendingSellerModel.fromJson(Map<String, dynamic> json) =>
      TrendingSellerModel(
        slNo: json["slNo"],
        sellerName: json["sellerName"],
        sellerProfilePhoto: json["sellerProfilePhoto"],
        sellerItemPhoto: json["sellerItemPhoto"],
        ezShopName: json["ezShopName"],
        defaultPushScore: json["defaultPushScore"].toDouble(),
        aboutCompany:
            json["aboutCompany"] == null ? null : json["aboutCompany"],
        allowCod: json["allowCOD"],
        division: json["division"],
        subDivision: json["subDivision"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        zipcode: json["zipcode"] == null ? null : json["zipcode"],
        country: json["country"],
        currencyCode: json["currencyCode"],
        orderQty: json["orderQty"],
        orderAmount: json["orderAmount"],
        salesQty: json["salesQty"],
        salesAmount: json["salesAmount"],
        highestDiscountPercent: json["highestDiscountPercent"],
        lastAddToCart: DateTime.parse(json["lastAddToCart"]),
        lastAddToCartThatSold: DateTime.parse(json["lastAddToCartThatSold"]),
      );
}
