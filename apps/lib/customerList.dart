import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wismilakapps/modelCustomer.dart';
import 'package:http/http.dart';
import 'package:wismilakapps/penjualanProduct.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  Future<List<ListCustomer>?> getData() async {
    try {
      Response response = await get(
          Uri.parse('http://172.27.8.253/wismilak/web/api/getListCustomer'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['status']) {
          final response = ModelCustomer.fromJson(body);

          return response.data;
        } else {
          throw body['data'];
        }
      } else {
        throw "Failed to load case list";
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUSTOMER LIST'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ListCustomer>?>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final customer = snapshot.data![index];
                  return GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PenjualanProduct(dataPenjualan: customer),
                          ))
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          color: Colors.lightBlueAccent),
                      child: Row(
                        children: [
                          const Icon(Icons.contacts),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customer.namaCustomer,
                                ),
                                Text(
                                  customer.alamatCustomer,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.info),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
