import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tugas 3'),
          centerTitle: true,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    controller.decrement();
                  },
                  child: Icon(Icons.remove)),
              SizedBox(width: 10),
              GetBuilder(
                  init: controller,
                  builder: (_) {
                    return Text('Counter : ${controller.counter} ');
                  }),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    controller.increment();
                  },
                  child: Icon(Icons.add)),
            ],
          ),
        ));
  }
}
