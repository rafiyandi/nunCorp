import 'package:flutter/material.dart';

class StateUtils {
  static Widget errorData(Function() onTap, {String? message}) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: const Icon(
            Icons.refresh_outlined,
            color: Colors.red,
          ),
        ),
        Text(
          message ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),
        )
      ],
    ));
  }

  static Padding loadingData({Color? backgroundColor}) {
    return Padding(
      padding: EdgeInsets.all(70),
      child: Center(
        child: CircularProgressIndicator(
          color: backgroundColor ?? Colors.red,
        ),
      ),
    );
  }
}
