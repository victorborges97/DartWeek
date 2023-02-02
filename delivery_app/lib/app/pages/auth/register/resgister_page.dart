import 'package:delivery_app/app/core/ui/styles/text_app.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class ResgisterPage extends StatelessWidget {
  const ResgisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cadastro",
                      style: context.textApp.textTitle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Preencha os campos abaixo para criar o \nseu cadastro",
                      style: context.textApp.textTitle.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nome*"),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "E-mail*"),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Senha*"),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Confirmar senha*"),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: DeliveryButton(
                        label: "CADASTRAR",
                        width: double.infinity,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
