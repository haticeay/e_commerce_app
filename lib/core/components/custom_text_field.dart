import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final TextAlign textAlign;
  final TextStyle? style;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final TextStyle? hintStyle;
  final bool isPassword; // Yeni özellik: Şifre alanı mı?
  final Widget? customSuffixIcon; // Yeni özellik: Özel suffix icon

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.enabled,
    this.maxLines = 1,
    this.minLines,
    this.textAlign = TextAlign.start,
    this.style,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.onTap,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.hintStyle,
    this.isPassword = false,
    this.customSuffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; 

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : widget.obscureText, // Eğer şifre alanıysa yerel durumu kullan
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      textAlign: widget.textAlign,
      style: widget.style,
      readOnly: widget.readOnly,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 8),
                child: SvgPicture.asset(
                  widget.prefixIcon.toString(),
                ),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: _toggleVisibility,
              )
            : widget.suffixIcon != null
                ? Icon(widget.suffixIcon, color: widget.suffixIconColor)
                : widget.customSuffixIcon, 
        border: widget.border ?? const OutlineInputBorder(),
        focusedBorder: widget.focusedBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
        enabledBorder: widget.enabledBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
        errorBorder: widget.errorBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
        focusedErrorBorder: widget.focusedErrorBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
        contentPadding: widget.contentPadding,
        fillColor: AppColor.filledColor,
        filled: true,
        hintStyle: TextStyle(
          color: const Color.fromRGBO(173, 173, 173, 1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ).merge(widget.hintStyle),
      ),
      onTap: widget.onTap,
    );
  }
}





