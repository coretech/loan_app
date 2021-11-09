import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class LoanCurrencyPicker extends StatelessWidget {
  const LoanCurrencyPicker({
    Key? key,
    required this.selectedCurrency,
    required this.onChanged,
  }) : super(key: key);

  final String selectedCurrency;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 110,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildCurrencyCard(context, 'KSH', FlagsCode.KE),
            _buildCurrencyCard(context, 'UGX', FlagsCode.UG),
            _buildCurrencyCard(context, 'RWF', FlagsCode.RW),
            _buildCurrencyCard(context, 'ETB', FlagsCode.ET),
            _buildCurrencyCard(context, 'CLP', FlagsCode.CL),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyCard(
    BuildContext context,
    String currency,
    FlagsCode countryCode,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            child: Card(
              color: selectedCurrency == currency
                  ? Theme.of(context).primaryColorLight
                  : null,
              elevation: 4,
              margin: EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  onChanged(currency);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flag.fromCode(
                        countryCode,
                        height: 25,
                        width: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        currency,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (selectedCurrency == currency)
            Positioned(
              top: 5,
              right: 5,
              child: Center(
                child: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
