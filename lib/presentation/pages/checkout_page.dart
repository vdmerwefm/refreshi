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
        body: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 900;
            if (wide) {
              return RefreshiPageBody(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(24),
                        child: _CatalogAndSchedule(),
                      ),
                    ),
                    SizedBox(
                      width: 380,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                        child: const _OrderSummary(),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CatalogAndSchedule(),
                  SizedBox(height: 16),
                  _OrderSummary(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
