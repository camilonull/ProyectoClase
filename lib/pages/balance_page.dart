import 'dart:math';

import 'package:calc_app/widgets/balance_page/back_sheet.dart';
import 'package:calc_app/widgets/balance_page/custom_fab.dart';
import 'package:calc_app/widgets/balance_page/front_sheet.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final _scrollController = ScrollController();
  double _offset = 0;
  double get _max => max(90 - _offset * 90, 0);

  final Logger _logger = Logger();
  void _listener() {
    setState(() {
      _offset = _scrollController.offset / 100;
      _logger.d(_offset);
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_listener);
    _max;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFab(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            elevation: 0.0,
            expandedHeight: 120.0,
            //backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ 50,000.00',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  Text(
                    'Balance',
                    style: TextStyle(color: Colors.amber, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Stack(
              children: [
                const BackSheet(),
                Padding(
                    padding: EdgeInsets.only(top: _max),
                    child: const FrontSheet())
              ],
            )
          ]))
        ],
      ),
    );
  }
}
