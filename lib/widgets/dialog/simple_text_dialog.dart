import 'package:flutter/material.dart';

import '../../app/app.dart';

class SimpleTextDialog extends StatelessWidget {
  const SimpleTextDialog({
    super.key,
    this.title,
    this.content,
    this.mainButtonText,
    this.mainButtonColor,
    this.mainButtonForegroundColor,
    this.onMainButton,
    this.showCancelButton = true,
  });

  final String? title;
  final String? content;
  final String? mainButtonText;
  final Color? mainButtonColor;
  final Color? mainButtonForegroundColor;
  final GestureTapCallback? onMainButton;
  final bool showCancelButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(40),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Material(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ..._buildTitle(context),
              if (content != null) ..._buildContent(),
              Row(
                children: [
                  if (showCancelButton)
                    Expanded(
                      child: FilledButton(
                        onPressed: () => navigatorKey.currentState!.pop(),
                        style: FilledButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('取消'),
                      ),
                    ),
                  if (showCancelButton && mainButtonText != null)
                    const SizedBox(width: 15),
                  if (mainButtonText != null)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onMainButton ?? () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              mainButtonForegroundColor ?? Colors.white,
                          backgroundColor: mainButtonColor ?? Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(mainButtonText!),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTitle(BuildContext context) => [
        Text(title!, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
      ];

  List<Widget> _buildContent() => [
        Flexible(
          child: SingleChildScrollView(
            child: Text(content!, style: const TextStyle(fontSize: 15)),
          ),
        ),
        if (mainButtonText != null || showCancelButton)
          const SizedBox(height: 20),
      ];
}
