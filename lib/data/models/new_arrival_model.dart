class NewArrivalModel {
  NewArrivalModel({
    this.slNo,
    this.productName,
    this.shortDetails,
    this.productDescription,
    this.availableStock,
    this.orderQty,
    this.salesQty,
    this.orderAmount,
    this.salesAmount,
    this.discountPercent,
    this.discountAmount,
    this.unitPrice,
    this.productImage,
    this.sellerName,
    this.sellerProfilePhoto,
    this.sellerCoverPhoto,
    this.ezShopName,
    this.defaultPushScore,
    this.myProductVarId,
  });

  final String? slNo;
  final String? productName;
  final String? shortDetails;
  final String? productDescription;
  final int? availableStock;
  final int? orderQty;
  final int? salesQty;
  final int? orderAmount;
  final int? salesAmount;
  final int? discountPercent;
  final int? discountAmount;
  final int? unitPrice;
  final String? productImage;
  final String? sellerName;
  final String? sellerProfilePhoto;
  final String? sellerCoverPhoto;
  final String? ezShopName;
  final double? defaultPushScore;
  final String? myProductVarId;

  factory NewArrivalModel.fromJson(Map<String, dynamic> json) =>
      NewArrivalModel(
        slNo: json["slNo"],
        productName: json["productName"],
        shortDetails: json["shortDetails"],
        productDescription: json["productDescription"],
        availableStock: json["availableStock"],
        orderQty: json["orderQty"],
        salesQty: json["salesQty"],
        orderAmount: json["orderAmount"],
        salesAmount: json["salesAmount"],
        discountPercent: json["discountPercent"],
        discountAmount: json["discountAmount"],
        unitPrice: json["unitPrice"],
        productImage: json["productImage"],
        sellerName: json["sellerName"],
        sellerProfilePhoto: json["sellerProfilePhoto"],
        sellerCoverPhoto: json["sellerCoverPhoto"],
        ezShopName: json["ezShopName"],
        defaultPushScore: json["defaultPushScore"].toDouble(),
        myProductVarId: json["myProductVarId"],
      );
}
