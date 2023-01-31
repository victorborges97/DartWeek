import 'package:delivery_app/app/core/extensions/formatter_extension.dart';
import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/styles/text_app.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:flutter/material.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  const DeliveryProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.name,
                    style: context.textApp.textExtraBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.description,
                    style: context.textApp.textLight.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    product.price.currencyPTBR,
                    style: context.textApp.textMedium.copyWith(
                      fontSize: 20,
                      color: context.colors.secundary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.gif",
            image: product.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
