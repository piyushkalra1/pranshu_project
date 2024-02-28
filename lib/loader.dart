
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


extension ShowingLoader on BuildContext {
  void showLoader() {
    return Loader.show(this,
        isAppbarOverlay: true,
        overlayFromTop: 100,
        progressIndicator: CircularProgressIndicator(),
        themeData: Theme.of(this).copyWith(
            colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
        overlayColor: Colors.grey.withOpacity(0.3));
  }

  void hideLoader() {
    Loader.hide();
  }
}

