import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loan_app/features/loan_application/loan_application.dart';

class LoanTypeCard extends StatelessWidget {
  const LoanTypeCard({
    Key? key,
    required this.index,
    required this.onSelection,
    required this.selectedLoanType,
    required this.loanType,
  }) : super(key: key);

  final int index;
  final ValueChanged<int> onSelection;
  final LoanType selectedLoanType;
  final LoanType loanType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: selectedLoanType == loanType
              ? Theme.of(context).primaryColorLight
              : null,
          elevation: 4,
          child: InkWell(
            onTap: () => onSelection(index),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: loanType.image,
                    height: 64,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loanType.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (selectedLoanType == loanType)
          Positioned(
            top: 10,
            right: 10,
            child: Center(
              child: Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
