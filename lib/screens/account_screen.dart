import 'package:flutter/material.dart';
import 'package:account_manager/models/account_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  final List<Account> accounts = [
    Account(name: "Crypto Wallet", amount: 99999),
    Account(name: "Shopping Budget", amount: 2500),
    Account(name: "Emergency Fund", amount: 75000),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void addAccount() {
    setState(() {
      accounts.add(Account(
        name: nameController.text,
        amount: double.tryParse(amountController.text) ?? 0, // CHANGED: Parse to double
      ));
      nameController.clear();
      amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                  title: Text(account.name),
                  subtitle: Text(account.amount.toString()), // CHANGED: Fixed type issue
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Account Name'),
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addAccount,
                  child: const Text('Add Account'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
