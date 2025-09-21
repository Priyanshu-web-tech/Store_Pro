import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_pro/product_store/model/app_state_model.dart';
import 'package:store_pro/product_store/widgets/cart_item.dart';
import 'package:store_pro/themes/styles.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String? name;
  String? email;
  String? mobile;
  String? address;
  DateTime? dateTime = DateTime.now();
  final formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Name',
          prefixIcon: Icon(Ionicons.person_outline),
          border: OutlineInputBorder()),
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value;
      },
      onChanged: (value) => setState(() => name = value),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Ionicons.mail_outline),
          border: OutlineInputBorder()),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String? value) {
        email = value;
      },
      onChanged: (value) => setState(() => email = value),
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Mobile',
          prefixIcon: Icon(Ionicons.call_outline),
          border: OutlineInputBorder()),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Mobile is Required';
        }
        if (value.length != 10) {
          return 'Mobile number must be of 10 digit';
        }
        return null;
      },
      onSaved: (String? value) {
        mobile = value;
      },
      onChanged: (value) => setState(() => mobile = value),
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Address',
          prefixIcon: Icon(Ionicons.location_outline),
          border: OutlineInputBorder()),
      keyboardType: TextInputType.streetAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        address = value;
      },
      onChanged: (value) => setState(() => address = value),
    );
  }

  // Time picker widget

  Widget _buildTimePicker() {
    return InkWell(
      onTap: () async {
        final newTime = await showDatePicker(
          context: context,
          initialDate: dateTime!,
          firstDate: DateTime(2000),
          lastDate: DateTime(2029),
        );

        if (newTime == null) {
          setState(() {
            dateTime = newTime;
          });
        }
        ;
      },
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: <Widget>[
                Icon(
                  Ionicons.time_outline,
                  size: 28,
                ),
                SizedBox(width: 6),
                Text('Delivery time', style: Styles.deliveryTimeLabel)
              ],
            ),
            Text(DateFormat.yMMMd().add_jm().format(dateTime!),
                style: Styles.deliveryTime)
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Consumer<AppStateModel>(builder: (context, value, child) {
          return ListView(
            children: [
              ExpansionTile(
                title: const Text('Address Details'),
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildName(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildEmail(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildMobile(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildAddress(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildTimePicker(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              if (value.productsInCart.isNotEmpty)
                ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItem(
                          product: value.getProductById(
                              value.productsInCart.keys.toList()[index]),
                          quantity:
                              value.productsInCart.values.toList()[index]);
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.productsInCart.length),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: Styles.productRowItemName),
                    Text('\$${value.totalCost}',
                        style: Styles.productRowItemName)
                  ],
                ),
              ),
              const Divider(),
              // Place Order Button
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      value.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Order Placed Successfully')));
                      ;
                    }
                  },
                  child: const Text('Place Order'))
            ],
          );
        }));
  }
}
