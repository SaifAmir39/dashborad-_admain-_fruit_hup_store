import 'package:dash_bord_fruite_hup/features/orders/presentaion/manger/bloc/order_bloc.dart';
import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/widgets/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersViewBody extends StatefulWidget {
  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  
  void initState() {
    super.initState();
    BlocProvider.of<OrderBloc>(context).add(GetOrderEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderError) {
            return Center(

              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50,),
                  Text("Error"),
                  SizedBox(height: 16,),
                  Text(
                    textAlign: TextAlign.center,
                    state.message,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is OrderSuccess) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 24)),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Icon(
                        Icons.note_alt_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(width: 16),
                      Text(
                        "Total Orders :${state.orders.length}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16)),
                SliverList.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                    child: OrderItems(orderEntiti: state.orders[index],),
                  ),
                  itemCount: state.orders.length,
                ),
              ],
            );
          }
          else if (state is OrderLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(child: Text("No Orders"));
        },
      ),
    );
  }
}
