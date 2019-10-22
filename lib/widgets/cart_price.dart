import 'package:flutter/material.dart';
import 'package:loja_flutter/models/cart_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPrice extends StatelessWidget {

  final VoidCallback buy;

  CartPrice(this.buy);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ScopedModelDescendant<CartModel>(
          builder: (context, child, model){
            double price = model.getProductPrice();
            double ship = model.getShipPrice();
            double discount = model.getDiscount();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Resumo do Pedido",
                  style: TextStyle(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 12.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Subtotal"),
                    Text("R\$ ${price.toStringAsFixed(2)}")
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Desconto"),
                    Text("R\$ ${discount.toStringAsFixed(2)}", style: TextStyle(color: Colors.redAccent),)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Entrega"),
                    Text("R\$ ${ship.toStringAsFixed(2)}")
                  ],
                ),
                Divider(),
                SizedBox(height: 12.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total", style: TextStyle(fontWeight: FontWeight.w500),),
                    Text("R\$ ${(price + ship - discount).toStringAsFixed(2)}", style: TextStyle(color: Theme.of(context).primaryColor),)
                  ],
                ),
                SizedBox(height: 12.0,),
                RaisedButton(
                  child: Text("Finalizar Pedido", style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).primaryColor,
                  onPressed: buy,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}