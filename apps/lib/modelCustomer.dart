import 'dart:convert';

ModelCustomer modelCustomerFromJson(String str) =>
    ModelCustomer.fromJson(json.decode(str));

class ModelCustomer {
  ModelCustomer({
    required this.status,
    required this.data,
  });

  bool status;
  List<ListCustomer> data;

  factory ModelCustomer.fromJson(Map<String, dynamic> json) => ModelCustomer(
        status: json["status"],
        data: List<ListCustomer>.from(
            json["data"].map((x) => ListCustomer.fromJson(x))),
      );
}

class ListCustomer {
  ListCustomer({
    required this.kodeCustomer,
    required this.namaCustomer,
    required this.alamatCustomer,
    required this.email,
  });

  String kodeCustomer;
  String namaCustomer;
  String alamatCustomer;
  String email;

  factory ListCustomer.fromJson(Map<String, dynamic> json) => ListCustomer(
        kodeCustomer: json["kode_customer"],
        namaCustomer: json["nama_customer"],
        alamatCustomer: json["alamat_customer"],
        email: json["email"],
      );
}
