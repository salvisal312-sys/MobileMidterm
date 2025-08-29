import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'style.dart'; // your Stylecolor class

class SocialButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback? onPressed; // optional now
  final String? link; // optional
  final Color? borderColor;

  const SocialButton({
    super.key,
    required this.imagePath,
    required this.label,
    this.onPressed,
    this.link,
    this.borderColor,
  });

  void _handlePress() async {
    if (link != null) {
      final uri = Uri.parse(link!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Cannot launch link: $link");
      }
    } else {
      onPressed?.call(); // use onPressed if link is null
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _handlePress,
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(Stylecolor.filledBackground2),
        side: WidgetStatePropertyAll(
          BorderSide(color: borderColor ?? Stylecolor.primary, width: 1.5),
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 24, height: 24),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
