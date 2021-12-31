import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({Key? key,required this.formKey,this.focusNode,required this.onEditingComplete,required this.onChange,required this.searchController,this.suffixIcon, this.prefixIcon}) : super(key: key);
  final GlobalKey<FormState> formKey;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final void Function(String)? onChange;
  final TextEditingController searchController;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        onEditingComplete: onEditingComplete,
        textInputAction: TextInputAction.search,
        validator: (value){
          if(value!.isEmpty){
            return 'Enter a topic or key word';
          }
          else{
            return null;
          }
        },
        focusNode: focusNode,
        onChanged: onChange,
        controller: searchController,
        cursorColor: Colors.black26,
        style:
        const TextStyle(color: Color(0xFFB6B6B6), fontSize: 20.0),
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.search,
          hintStyle: const TextStyle(color: Color(0xFFB6B6B6)),
          filled: true,
          fillColor: const Color(0xFFF0F0F0),
          prefixIcon: prefixIcon,
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.transparent)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.transparent)),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
