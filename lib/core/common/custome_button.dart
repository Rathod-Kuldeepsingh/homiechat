import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.text,
    this.child,
    this.onpressed,
  }) : assert(
         text != null || child != null,
         'Either text or child must be provided',
       );

  final String text;
  final Widget? child;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
            padding: WidgetStateProperty.all(EdgeInsets.all(10)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          onPressed: onpressed == null
              ? null
              : () async {
                  await onpressed?.call();
                },
          child:
              child ??
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
        ),
      ),
    );
  }
}
