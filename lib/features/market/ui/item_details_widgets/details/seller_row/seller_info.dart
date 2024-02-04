import 'package:final_project/core/widgets/seller_contacts_buttons.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_detail_info.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_image.dart';
import 'package:flutter/material.dart';

class SellerInfo extends StatelessWidget {
  const SellerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.12,
      padding: const EdgeInsets.all(12),
      child: const Row(
        children: [
          SellerImage(),
          SizedBox(width: 8,),
          SellerDetailsInfo(),
          Spacer(),
          SellerContactsButtons(),
        ],
      ),
    );
  }
}
