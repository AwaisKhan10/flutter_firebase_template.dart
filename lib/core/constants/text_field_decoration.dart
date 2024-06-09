import 'package:flutter/material.dart';
import 'package:furry_care/core/constants/colors.dart';

final authFieldDecoration = InputDecoration(
  hintText: "Enter your email",

  ///
  /// Text Style Additional
  ///
  hintStyle: const TextStyle(),
  prefixIconColor: primaryColor,
  suffixIconColor: primaryColor,
  fillColor: primaryColor,
  filled: true,
  contentPadding: const EdgeInsets.all(25),
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
      borderRadius: BorderRadius.circular(16)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
      borderRadius: BorderRadius.circular(16)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
      borderRadius: BorderRadius.circular(16)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
      borderRadius: BorderRadius.circular(16)),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
      borderRadius: BorderRadius.circular(16)),
);
