import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String categoryName;
  final VoidCallback onConfirm;

  DeleteConfirmationDialog({
    required this.categoryName,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Category'),
      content: Text('Are you sure you want to delete "$categoryName"?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: Text('Delete'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
