import 'package:delivery_app/app/core/ui/styles/text_app.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:delivery_app/app/pages/order/widgets/order_field.dart';
import 'package:delivery_app/app/pages/order/widgets/order_product_tile.dart';
import 'package:delivery_app/app/pages/order/widgets/payment_types_field.dart';
import 'package:easy_comp/easy_comp.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final List<OrderProductDto> bag;
  const OrderPage({Key? key, required this.bag}) : super(key: key);
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _enderecoEntregaEC = TextEditingController();

  @override
  void dispose() {
    _enderecoEntregaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Text(
                    "Carrinho",
                    style: context.textApp.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.restore_from_trash,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return Column(
                  children: [
                    OrderProductTile(
                      index: index,
                      produtoDto: OrderProductDto(
                        amount: 1,
                        product: ProductModel(
                          id: 1,
                          description: "",
                          image: "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800",
                          name: "Produto Teste",
                          price: 15,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                  ],
                );
              },
              childCount: 2,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total do pedido",
                        style: context.textApp.textExtraBold.copyWith(fontSize: 16),
                      ),
                      Text(
                        r"R$ 200,00",
                        style: context.textApp.textExtraBold.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  titulo: "Endereço de entrega",
                  controller: _enderecoEntregaEC,
                  hintText: "Digite um endereco",
                  validator: ValidatorUtil().required().build(),
                ),
                const SizedBox(
                  height: 10,
                ),
                OrderField(
                  titulo: "CPF",
                  controller: _enderecoEntregaEC,
                  hintText: "Digite o CPF",
                  validator: ValidatorUtil().required().build(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentTypesField(),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DeliveryButton(
                    label: "FINALIZAR",
                    width: double.infinity,
                    height: 42,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
