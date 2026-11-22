part of '../../pages/checkout_page.dart';

class _CheckoutBody extends StatelessWidget {
  const _CheckoutBody();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
    );
  }
}
