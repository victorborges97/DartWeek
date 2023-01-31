import 'package:delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/pages/home/home_controller.dart';
import 'package:delivery_app/app/pages/home/home_state.dart';
import 'package:delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    super.onReady();
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            showLoader();
            await Future.delayed(Duration(seconds: 3));
            throw "Error teste novo jeito";
            hideLoader();
          } catch (e) {
            hideLoader();
            showError("$e");
            await Future.delayed(Duration(seconds: 2));
            showInfo("$e");
            await Future.delayed(Duration(seconds: 2));
            showSuccess("$e");
          }
        },
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? "Error não informado");
            },
          );
        },
        buildWhen: (previus, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              await context.read<HomeController>().loadProducts();
              return Future.value();
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => DeliveryProductTile(
                      product: state.products[index],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
