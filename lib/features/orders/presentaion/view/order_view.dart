import 'package:dash_bord_fruite_hup/core/services/get_it_service.dart';
import 'package:dash_bord_fruite_hup/features/orders/domain/repo/order_repo.dart';
import 'package:dash_bord_fruite_hup/features/orders/presentaion/manger/bloc/order_bloc.dart';
import 'package:dash_bord_fruite_hup/features/orders/presentaion/manger/bloc/updateorder_bloc.dart';
import 'package:dash_bord_fruite_hup/features/orders/presentaion/view/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc( orderRepo: getIt.get<OrderRepo>(),),

        ),
        BlocProvider<UpdateorderBloc>(
          create: (context) => UpdateorderBloc( orderRepo: getIt.get<OrderRepo>(),),

        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(size: 30, Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color(0xFF1B5E37),
          title: Text(
            'Orders',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,

              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: OrdersViewBody(),
      ),
    );
  }
}
