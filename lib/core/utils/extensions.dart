import 'package:intl/intl.dart';

/// Useful extensions for common types
extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('dd MMM yyyy').format(this);
  String get formattedDateTime =>
      DateFormat('dd MMM yyyy, hh:mm a').format(this);
}

extension StringExtension on String {
  String get capitalize =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';
  String get capitalizeWords =>
      split(' ').map((word) => word.capitalize).join(' ');
}

extension DoubleExtension on double {
  String get formattedPrice => '₹${toStringAsFixed(0)}';
  String get formattedDecimal => toStringAsFixed(2);
}

extension IntExtension on int {
  String get formattedPrice => '₹$this';
}
