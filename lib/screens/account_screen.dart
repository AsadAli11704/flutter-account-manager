import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/account_model.dart';
import '../providers/account_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1), // 🌙 Eye-friendly warm yellow
      appBar: AppBar(
        title: const Text("Account Manager"),
        centerTitle: true,
        backgroundColor: Colors.teal, // 🌟 Solid color (NO gradient)
      ),
      body: Column(
        children: [
          // --------- Input Fields ----------
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.teal),
                    labelText: "Account Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _detailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description, color: Colors.teal),
                    labelText: "Detail",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.money, color: Colors.teal),
                    labelText: "Amount (PKR)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                // 🌟 Solid Color Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      final name = _nameController.text;
                      final detail = _detailController.text;
                      final amount = double.tryParse(_amountController.text);

                      if (name.isNotEmpty && amount != null) {
                        accountProvider.addAccount(
                          Account(
                            name: name,
                            detail: detail,
                            amount: amount,
                          ),
                        );
                        _nameController.clear();
                        _detailController.clear();
                        _amountController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // ✅ Contrast solid color
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Add Account",
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),

          // --------- Accounts List ----------
          Expanded(
            child: ListView.builder(
              itemCount: accountProvider.accounts.length,
              itemBuilder: (context, index) {
                final account = accountProvider.accounts[index];

                // 🎨 Color logic for amount
                Color amountColor;
                if (account.amount >= 10000) {
                  amountColor = Colors.pinkAccent;
                } else if (account.amount >= 5000) {
                  amountColor = Colors.green;
                } else {
                  amountColor = Colors.blue;
                }

                return Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.teal,
                    ), // 💰 Wallet Icon
                    title: Text(
                      account.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(account.detail),
                    trailing: Text(
                      "PKR ${account.amount.toStringAsFixed(0)}",
                      style: TextStyle(
                          color: amountColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
