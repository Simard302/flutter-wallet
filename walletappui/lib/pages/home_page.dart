// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/utils/my_button.dart';
import 'package:walletappui/utils/my_card.dart';
import 'package:walletappui/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.pink,
          child: Icon(Icons.monetization_on, size: 32)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home,
                          size: 32, color: Colors.pink.shade200)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings, size: 32, color: Colors.grey))
                ]),
          )),
      body: SafeArea(
        child: Column(children: [
          // App bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                    Text('My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    Text(' Cards', style: TextStyle(fontSize: 28)),
                  ]),

                  // plus button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ]),
          ),
          const SizedBox(height: 25),

          // cards
          Container(
              height: 180,
              child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                        balance: 5250.20,
                        cardNumber: 1234,
                        expiryMonth: 10,
                        expiryYear: 24,
                        color: Colors.deepPurple.shade300),
                    MyCard(
                        balance: 200.20,
                        cardNumber: 3456,
                        expiryMonth: 11,
                        expiryYear: 27,
                        color: Colors.blue.shade300),
                    MyCard(
                        balance: 89425.16,
                        cardNumber: 7890,
                        expiryMonth: 07,
                        expiryYear: 26,
                        color: Colors.orange.shade300),
                  ])),

          SizedBox(height: 25),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800, dotHeight: 16),
          ),

          SizedBox(height: 25),

          // 3 buttons -> send, pay, bills
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // send button
                  MyButton(
                      iconImagePath: 'lib/icons/send-money.png',
                      buttonText: 'Send'),

                  // pay button
                  MyButton(
                      iconImagePath: 'lib/icons/credit-card.png',
                      buttonText: 'Pay'),

                  // bills button
                  MyButton(
                      iconImagePath: 'lib/icons/bill.png', buttonText: 'Bill'),
                ]),
          ),

          SizedBox(height: 25),

          // column -> stats + transactions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                // statistics
                MyListTile(
                  iconImagePath: 'lib/icons/statistics.png',
                  tileTitle: 'Statistics',
                  tileSubtitle: 'Payments and Income',
                ),

                // transaction
                MyListTile(
                  iconImagePath: 'lib/icons/transaction.png',
                  tileTitle: 'Transactions',
                  tileSubtitle: 'Transaction History',
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
