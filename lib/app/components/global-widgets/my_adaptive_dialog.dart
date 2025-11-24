import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AdaptiveDialogAction { yes, no, cancel }

class MyAdaptiveDialog {
  static Future<AdaptiveDialogAction?> show({
    required BuildContext context,
    required String title,
    required Widget content,
    bool showCancel = true,
    String? yesLabel,
    String? noLabel,
    Color? yesColor,
    Color? noColor,
    bool centerTitle = false,
    TextStyle? titleTextStyle, // New: Optional custom title style
  }) async {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return _showCupertinoDialog(
        context: context,
        title: title,
        content: content,
        showCancel: showCancel,
        yesLabel: yesLabel,
        noLabel: noLabel,
        yesColor: yesColor,
        noColor: noColor,
        centerTitle: centerTitle,
        titleTextStyle: titleTextStyle,
      );
    } else {
      return _showMaterialDialog(
        context: context,
        title: title,
        content: content,
        showCancel: showCancel,
        yesLabel: yesLabel,
        noLabel: noLabel,
        yesColor: yesColor,
        noColor: noColor,
        centerTitle: centerTitle,
        titleTextStyle: titleTextStyle,
      );
    }
  }

  static Future<AdaptiveDialogAction?> _showMaterialDialog({
    required BuildContext context,
    required String title,
    required Widget content,
    required bool showCancel,
    required String? yesLabel,
    required String? noLabel,
    Color? yesColor,
    Color? noColor,
    required bool centerTitle,
    TextStyle? titleTextStyle,
  }) async {
    final actions = <Widget>[];

    if (showCancel) {
      actions.add(
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(AdaptiveDialogAction.cancel),
          child: const Text('Cancel'),
        ),
      );
    }

    if (noLabel != null) {
      actions.add(
        TextButton(
          style: TextButton.styleFrom(foregroundColor: noColor),
          onPressed: () => Navigator.of(context).pop(AdaptiveDialogAction.no),
          child: Text(noLabel),
        ),
      );
    }

    if (yesLabel != null) {
      actions.add(
        TextButton(
          style: TextButton.styleFrom(foregroundColor: yesColor),
          onPressed: () => Navigator.of(context).pop(AdaptiveDialogAction.yes),
          child: Text(yesLabel),
        ),
      );
    }

    return await showDialog<AdaptiveDialogAction>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          textAlign: centerTitle ? TextAlign.center : TextAlign.start,
          style: titleTextStyle,
        ),
        content: SingleChildScrollView(child: content),
        actions: actions,
      ),
    );
  }

  static Future<AdaptiveDialogAction?> _showCupertinoDialog({
    required BuildContext context,
    required String title,
    required Widget content,
    required bool showCancel,
    required String? yesLabel,
    required String? noLabel,
    Color? yesColor,
    Color? noColor,
    required bool centerTitle,
    TextStyle? titleTextStyle,
  }) async {
    final actions = <CupertinoDialogAction>[];

    if (showCancel) {
      actions.add(
        CupertinoDialogAction(
          onPressed: () =>
              Navigator.of(context).pop(AdaptiveDialogAction.cancel),
          child: const Text('Cancel'),
        ),
      );
    }

    if (noLabel != null) {
      actions.add(
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(AdaptiveDialogAction.no),
          textStyle: noColor != null ? TextStyle(color: noColor) : null,
          child: Text(noLabel),
        ),
      );
    }

    if (yesLabel != null) {
      actions.add(
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(AdaptiveDialogAction.yes),
          textStyle: yesColor != null ? TextStyle(color: yesColor) : null,
          child: Text(yesLabel),
        ),
      );
    }

    return await showCupertinoDialog<AdaptiveDialogAction>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          title,
          textAlign: centerTitle ? TextAlign.center : TextAlign.start,
          style: titleTextStyle,
        ),
        content: content,
        actions: actions,
      ),
    );
  }
}
