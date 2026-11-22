import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:refreshi/app/router/app_router.dart';
import 'package:refreshi/core/constants/refreshi_constants.dart';
import 'package:refreshi/domain/refreshi_models/refreshi_service_dto/refreshi_service_dto.dart';
import 'package:refreshi/presentation/auth_bloc/auth_bloc.dart';
import 'package:refreshi/presentation/widgets/refreshi_button.dart';
import 'package:refreshi/presentation/helpers/refreshi_schedule_helper.dart';
import 'package:refreshi/presentation/refreshi_bloc/refreshi_bloc.dart';
import 'package:refreshi/presentation/widgets/refreshi_app_bar.dart';
import 'package:refreshi/presentation/widgets/refreshi_page_body.dart';
import 'package:refreshi/presentation/widgets/refreshi_formatters.dart';

part '../widgets/checkout/_checkout_body.dart';
part '../widgets/checkout/_catalog_and_schedule.dart';
part '../widgets/checkout/_service_list.dart';
part '../widgets/checkout/_service_tile.dart';
part '../widgets/checkout/_schedule_picker.dart';
part '../widgets/checkout/_time_slot_box.dart';
part '../widgets/checkout/_order_summary.dart';
part '../widgets/checkout/_summary_row.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RefreshiBloc, RefreshiState>(
      listenWhen: (previous, current) =>
          current.createdOrderId != null &&
          previous.createdOrderId != current.createdOrderId,
      listener: (context, state) {
        //go replaces checkout in history so back or refresh never resubmits
        context.go(RefreshiRoutes.order(state.createdOrderId!));
        context.read<RefreshiBloc>().add(const RefreshiEvent.resetCheckout());
      },
      child: Scaffold(
        appBar: const RefreshiAppBar(),
        //nothing renders until services are in, so times and the summary don't load in ahead of them
        //keyed on services not isLoading, isLoading also flips while an order is being placed
        body: BlocBuilder<RefreshiBloc, RefreshiState>(
          buildWhen: (previous, current) =>
              previous.refreshiServices != current.refreshiServices ||
              (current.refreshiServices == null &&
                  previous.failure != current.failure),
          builder: (context, state) {
            if (state.refreshiServices == null) {
              if (state.failure != null) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.failure!.message),
                      const SizedBox(height: 16),
                      RefreshiButton(
                        label: 'Retry',
                        onTap: () => context.read<RefreshiBloc>().add(
                          const RefreshiEvent.getRefreshiServices(),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }
            return const _CheckoutBody();
          },
        ),
      ),
    );
  }
}
