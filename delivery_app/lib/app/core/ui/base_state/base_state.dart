import 'package:bloc/bloc.dart';
import 'package:delivery_app/app/core/ui/helpers/loader.dart';
import 'package:delivery_app/app/core/ui/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase> extends State<T> with Loader, Messages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onInit() {}

  void onReady() {}
}
