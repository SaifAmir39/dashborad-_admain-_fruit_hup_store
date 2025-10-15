import 'package:dash_bord_fruite_hup/features/dashboard/presentation/views/widgets/dashboed_body.dart';
import 'package:flutter/material.dart';

class DashbordViwe extends StatelessWidget {
  static const String routeName = 'DashbordViwe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DashboedBody(),
      ),
    ),
    );
  }
}