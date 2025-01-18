import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color.fromARGB(181, 206, 177, 144),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(181, 206, 177, 144),
        title: const Text('Payment Methods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PaymentMethodTile(
              iconData: Icons.credit_card,
              title: 'Santim Pay',
              subtitle: 'Expires 07/25',
              onTap: () {
                // Handle tap on this payment method (e.g., select it)
              },
              onDelete: () {
                // Handle deletion of this payment method
              },
            ),
            PaymentMethodTile(
              iconData: Icons.credit_card,
              title: 'Chapa Intergration',
              subtitle: 'Expires 07/25',
              onTap: () {
                // Handle tap on this payment method (e.g., select it)
              },
              onDelete: () {
                // Handle deletion of this payment method
              },
            ),
            PaymentMethodTile(
              iconData: Icons.credit_card,
              title: 'TeleBirr +25197*****6',
              subtitle: 'Expires 09/26',
              onTap: () {
                // Handle tap on this payment method (e.g., select it)
              },
              onDelete: () {
                // Handle deletion of this payment method
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Payment Method'),
              onTap: () {
                // Navigate to add payment method screen or show modal dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const PaymentMethodTile({
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
