import 'package:flutter/material.dart';
import 'package:helloworld/PaymentSuccessScreen.dart';

class PaymentMethodPage extends StatelessWidget {
  final List<Map<String, dynamic>> paymentMethods = [
    {
      'name': 'OVO',
      'logo': 'assets/images/ovo.png',
    },
    {
      'name': 'BCA',
      'logo': 'assets/images/bca.png',
    },
    {
      'name': 'GoPay',
      'logo': 'assets/images/gopay.png',
    },
    {
      'name': 'BRI',
      'logo': 'assets/images/bri.png',
    },
    // Tambahkan metode pembayaran lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 300));
                    Navigator.pop(context);
                  },
                  child: Ink(
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                return ListTile(
                  leading: Image.asset(
                    method['logo'],
                    width: 32,
                    height: 32,
                  ),
                  title: Text(method['name']),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Konfirmasi Pembayaran'),
                          content: Text(
                              'Anda telah memilih metode pembayaran: ${method['name']}'),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                await Future.delayed(
                                    Duration(milliseconds: 500));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) =>
                                        PaymentSuccessScreen(),
                                  ),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
