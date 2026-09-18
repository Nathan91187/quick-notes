import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(BuildContext context, {required String hintText}){
  final colors = Theme.of(context).colorScheme;
  return InputDecoration(
      fillColor: colors.onPrimaryContainer.withValues(alpha: 50),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: Colors.white12
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: colors.onPrimaryContainer.withValues(alpha: 0.2),
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: colors.primary,
          )
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: colors.error
        )
      ),
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 15
      ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: colors.error,
        width: 1.5,),
    ),
  );
}