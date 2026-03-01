import 'package:flutter/material.dart';
import 'package:call_tracker/utils/native_methods.dart';
import 'package:call_tracker/utils/snackbar.dart';
import 'package:call_tracker/l10n/app_localizations.dart';

class ContactHandler {
  static Future<void> handleAddToContacts(
    BuildContext context,
    String? phoneNumber,
  ) async {
    if (phoneNumber == null) return;
    bool launchSuccess = await NativeMethods.addToContacts(phoneNumber);
    if (!launchSuccess) {
      if (context.mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).addToContactsErrorText,
        );
      }
    }
  }

  static Future<void> handleOpenContact(
    BuildContext context,
    String? phoneNumber,
  ) async {
    if (phoneNumber == null) return;
    bool launchSuccess = await NativeMethods.openContact(phoneNumber);
    if (!launchSuccess) {
      if (context.mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).errorOpeningContact,
        );
      }
    }
  }
}
