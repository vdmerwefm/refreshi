import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi/app/router/app_router.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_order_dto/refreshi_order_dto.dart';
import 'package:refreshi/presentation/pages/not_found_page.dart';
import 'package:refreshi/presentation/refreshi_bloc/refreshi_bloc.dart';
import 'package:refreshi/presentation/widgets/refreshi_app_bar.dart';
import 'package:refreshi/presentation/widgets/refreshi_button.dart';
import 'package:refreshi/presentation/widgets/refreshi_page_body.dart';
import 'package:refreshi/presentation/widgets/refreshi_formatters.dart';

part '../widgets/order_details/_order_details_body.dart';
part '../widgets/order_details/_brutal_box.dart';
part '../widgets/order_details/_status_tile.dart';
part '../widgets/order_details/_order_row.dart';

//built from the url alone so a deep link or refresh just fetches the order again
class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({required this.orderId, super.key});

  final String orderId;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant OrderDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.orderId != widget.orderId) _load();
  }

  //polls until the hold is placed
  void _load() => context.read<RefreshiBloc>().add(
    RefreshiEvent.getRefreshiOrder(widget.orderId),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RefreshiBloc, RefreshiState>(
      buildWhen: (previous, current) =>
          previous.refreshiOrder != current.refreshiOrder ||
          previous.isLoading != current.isLoading ||
          previous.failure != current.failure,
      builder: (context, state) {
        final order = state.refreshiOrder;

        //repo returns an empty order for an unknown id
        if (!state.isLoading && order != null && order.id.isEmpty) {
          return const NotFoundPage(message: 'Order not found');
        }

        final Widget body;
        if (order != null && order.id == widget.orderId) {
          body = _OrderDetails(order: order);
        } else if (state.failure != null && !state.isLoading) {
          body = Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.failure!.message),
                TextButton(onPressed: _load, child: const Text('Retry')),
              ],
            ),
          );
        } else {
          body = const Center(child: CircularProgressIndicator());
        }

        return Scaffold(appBar: const RefreshiAppBar(), body: body);
      },
    );
  }
}
