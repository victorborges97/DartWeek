import 'package:delivery_app/app/pages/order/order_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(),
          ),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          debugPrint(args.toString());
          return const OrderPage(
            bag: [], //args["bag"],
          );
        },
      );
}
