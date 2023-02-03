import 'package:delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/styles/text_app.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> shoppingBag;
  const ShoppingBagWidget(this.shoppingBag, {super.key});

  Future<void> _getOrders(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey("accessToken")) {
      final loginResult = await navigator.pushNamed("/auth/login");
      if (loginResult == null || loginResult == false) {
        return;
      }
    }

    navigator.pushNamed("/order", arguments: {
      "bag": shoppingBag,
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalBag = shoppingBag.fold<double>(0.0, (total, element) => total += element.totalPrice);

    return Container(
        width: context.screenWidth,
        height: 90,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            _getOrders(context);
          },
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.shopping_cart_outlined),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Ver Sacola",
                  style: context.textApp.textExtraBold.copyWith(fontSize: 14),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  totalBag.currencyPTBR,
                  style: context.textApp.textExtraBold.copyWith(fontSize: 11),
                ),
              )
            ],
          ),
        ));
  }
}
