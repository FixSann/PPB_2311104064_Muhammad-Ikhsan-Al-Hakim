import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(int) onRemove;
  final Function(List<int>) onCheckout;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onRemove,
    required this.onCheckout,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool deleteMode = false; // false = checkout mode, true = delete mode
  List<int> checkoutSelected = [];
  List<int> deleteSelected = [];

  String rupiah(num number) {
    return NumberFormat.currency(
      locale: "id",
      decimalDigits: 0,
      symbol: "Rp ",
    ).format(number);
  }

  int get totalCheckout {
    return checkoutSelected.fold(
      0,
      (sum, index) =>
          sum + int.parse(widget.cartItems[index]['price'].toString()),
    );
  }

  void toggleDeleteMode() {
    setState(() {
      deleteMode = !deleteMode;
      deleteSelected.clear();
    });
  }

  void deleteItems() {
    deleteSelected.sort((a, b) => b.compareTo(a));
    for (var index in deleteSelected) {
      widget.onRemove(index);
    }
    setState(() {
      deleteSelected.clear();
      deleteMode = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Barang berhasil dihapus")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        backgroundColor: const Color.fromARGB(255, 251, 251, 251),
        actions: [
          if (widget.cartItems.isNotEmpty)
            TextButton(
              onPressed: toggleDeleteMode,
              child: Text(
                deleteMode ? "Selesai" : "Edit",
                style: const TextStyle(color: Color.fromARGB(255, 16, 15, 15)),
              ),
            ),
        ],
      ),

      body: widget.cartItems.isEmpty
          ? const Center(child: Text("Keranjang kosong 😅"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      final isCheckoutChecked = checkoutSelected.contains(
                        index,
                      );
                      final isDeleteChecked = deleteSelected.contains(index);

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: deleteMode
                                ? isDeleteChecked
                                : isCheckoutChecked,
                            activeColor: deleteMode
                                ? Colors.red
                                : Colors.orange,
                            onChanged: (_) {
                              setState(() {
                                if (deleteMode) {
                                  isDeleteChecked
                                      ? deleteSelected.remove(index)
                                      : deleteSelected.add(index);
                                } else {
                                  isCheckoutChecked
                                      ? checkoutSelected.remove(index)
                                      : checkoutSelected.add(index);
                                }
                              });
                            },
                          ),
                          title: Text(item['name']),
                          subtitle: Text(
                            rupiah(int.parse(item['price'].toString())),
                          ),
                          trailing: Image.asset(item['image'], width: 60),
                        ),
                      );
                    },
                  ),
                ),

                // FOOTER
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                    color: Colors.white,
                  ),
                  child: deleteMode
                      ? ElevatedButton(
                          onPressed: deleteSelected.isNotEmpty
                              ? deleteItems
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(double.infinity, 45),
                          ),
                          child: const Text("Hapus Barang"),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total: ${rupiah(totalCheckout)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: checkoutSelected.isNotEmpty
                                  ? () {
                                      widget.onCheckout(checkoutSelected);
                                      setState(() {
                                        checkoutSelected.clear();
                                      });
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              child: const Text("Checkout"),
                            ),
                          ],
                        ),
                ),
              ],
            ),
    );
  }
}
