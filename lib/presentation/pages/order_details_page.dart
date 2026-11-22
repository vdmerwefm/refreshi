import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi/app/router/app_router.dart';
import 'package:refreshi/core/constants/refreshi_constants.dart';
import 'package:refreshi/core/error/refreshi_failure.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/presentation/pages/not_found_page.dart';
import 'package:refreshi/di/injection.dart';
import 'package:refreshi/presentation/refreshi_order_bloc/refreshi_order_bloc.dart';
import 'package:refreshi/presentation/widgets/refreshi_app_bar.dart';
import 'package:refreshi/presentation/widgets/refreshi_button.dart';
import 'package:refreshi/presentation/widgets/refreshi_page_body.dart';
import 'package:refreshi/presentation/widgets/refreshi_formatters.dart';

part '../widgets/order_details/_order_details_body.dart';
part '../widgets/order_details/_brutal_box.dart';
part '../widgets/order_details/_status_tile.dart';
part '../widgets/order_details/_order_row.dart';

//built from the url alone so a deep link or refresh just fetches the order again
class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //polls until the hold is placed, stops when the page closes
      create: (context) =>
          refreshiSl<RefreshiOrderBloc>()
            ..add(RefreshiOrderEvent.getRefreshiOrder(orderId)),
      child: BlocBuilder<RefreshiOrderBloc, RefreshiOrderState>(
        builder: (context, state) {
          final order = state.refreshiOrder;

          if (!state.isLoading && state.failure is OrderNotFoundException) {
            return const NotFoundPage(message: 'Order not found');
          }

          final Widget body;
          if (order != null) {
            body = _OrderDetails(order: order);
          } else if (state.failure != null && !state.isLoading) {
            body = Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.failure!.message),
                  TextButton(
                    onPressed: () => context.read<RefreshiOrderBloc>().add(
                      RefreshiOrderEvent.getRefreshiOrder(orderId),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            body = const Center(child: CircularProgressIndicator());
          }

          return Scaffold(appBar: const RefreshiAppBar(), body: body);
        },
      ),
    );
  }
}
