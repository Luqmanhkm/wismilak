import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wismilakapps/customerList.dart';
import 'package:wismilakapps/modelCustomer.dart';
import 'package:wismilakapps/modelTempPenjualan.dart';

class PenjualanProduct extends StatefulWidget {
  // const PenjualanProduct({super.key});
  const PenjualanProduct({Key? key, required this.dataPenjualan})
      : super(key: key);
  final ListCustomer dataPenjualan;

  @override
  State<PenjualanProduct> createState() => _PenjualanProductState();
}

class _PenjualanProductState extends State<PenjualanProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () => {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const CustomerList();
            })),
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('PENJUALAN'),
            Row(
              children: [
                Text('${widget.dataPenjualan.namaCustomer}.'),
                const SizedBox(
                  width: 10,
                ),
                Text(widget.dataPenjualan.alamatCustomer),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('TAMBAH PRODUCT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
