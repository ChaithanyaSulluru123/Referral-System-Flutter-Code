import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});
  static const Color green = Color(0xFF21845F);
  static const Color darkText = Color(0xFF183B3B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FA),
        elevation: 0,
        title: const Text('My Wallet',
          style: TextStyle(color: darkText,fontSize: 18,fontWeight: FontWeight.bold,),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Cashback',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),

            const SizedBox(height: 6),

            Text('Manage your referral cashback and earnings.',
              style: TextStyle(fontSize: 13,color: Colors.grey.shade600,),
            ),

            const SizedBox(height: 22),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade800,
                    green,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Available Balance',
                        style: TextStyle(color: Colors.white70,fontSize: 14,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  const Text('₹ --',
                    style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Divider(color: Colors.white30),

                  const SizedBox(height: 12),

                  const Text('Total Cashback Earned',
                    style: TextStyle(color: Colors.white70,fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text('₹ --',
                    style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text('Transaction History',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: darkText,
              ),
            ),

            const SizedBox(height: 14),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F4E8),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.receipt_long_outlined,
                      color: green,
                      size: 38,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text('No Transactions Yet',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: darkText,),
                  ),

                  const SizedBox(height: 8),

                  Text('Your cashback transactions will appear here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600,fontSize: 12,),
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
