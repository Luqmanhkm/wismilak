import 'dart:convert';

ModelTempPenjualan modelTempPenjualanFromJson(String str) =>
    ModelTempPenjualan.fromJson(json.decode(str));

// String modelTempPenjualanToJson(ModelTempPenjualan data) =>
//     json.encode(data.toJson());

class ModelTempPenjualan {
  ModelTempPenjualan({
    required this.status,
    required this.data,
  });

  bool status;
  List<ListTempPenjualan> data;

  factory ModelTempPenjualan.fromJson(Map<String, dynamic> json) =>
      ModelTempPenjualan(
        status: json["status"],
        data: List<ListTempPenjualan>.from(
            json["data"].map((x) => ListTempPenjualan.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "status": status,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //     };
}

class ListTempPenjualan {
  ListTempPenjualan({
    required this.idTemp,
    required this.kodeCustomer,
    required this.kodeProduct,
    required this.qty,
    required this.price,
    required this.subtotal,
  });

  String idTemp;
  String kodeCustomer;
  String kodeProduct;
  String qty;
  String price;
  String subtotal;

  factory ListTempPenjualan.fromJson(Map<String, dynamic> json) =>
      ListTempPenjualan(
        idTemp: json["idTemp"],
        kodeCustomer: json["kode_customer"],
        kodeProduct: json["kode_product"],
        qty: json["qty"],
        price: json["price"],
        subtotal: json["subtotal"],
      );

  // Map<String, dynamic> toJson() => {
  //       "idTemp": idTemp,
  //       "kode_customer": kodeCustomer,
  //       "kode_product": kodeProduct,
  //       "qty": qty,
  //       "price": price,
  //       "subtotal": subtotal,
  //     };
}
