import 'package:final_project/core/constants.dart';
import 'package:final_project/core/models/chat_model.dart';
import 'package:final_project/core/models/default_user.dart';
import 'package:final_project/core/models/the_data_to_profile_as_visitor.dart';
import 'package:final_project/core/models/user_data.dart';
import 'package:final_project/core/networking/local/caching_helper.dart';
import 'package:final_project/core/routing/routes.dart';
import 'package:final_project/core/widgets/seller_contacts_buttons.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_detail_info.dart';
import 'package:final_project/features/market/ui/item_details_widgets/details/seller_row/seller_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerInfo extends StatelessWidget {
  const SellerInfo({super.key,required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.12,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.profileScreen,arguments: DataToProfileAsVisitor(
                isVisitor: (user.id != CachHelper.getId()),
                id: user.id,
              ),
              );
            },
            child: Row(
              children: [
                SellerImage(
                  image: user.photo ?? '',
                ),
                const SizedBox(width: 8,),
                SellerDetailsInfo(
                  name: user.name!,
                  //job: user.job!,
                  sellerRating: user.userRating!.toDouble(),
                ),
              ],
            ),
          ),
          const Spacer(),
          SellerContactsButtons(
            phoneOnTap: () async {
                final Uri uri = Uri.parse(
                    'tel:${user.phone}'
                );
                if (user.phone != null) {
                  await launchUrl(uri);
                } else {
                  throw 'لا يوجد رقم هاتف';
                }
            },
            messageOnTap: (){
              ChatBodyModel n = ChatBodyModel(name: user.name ?? defaultUser().name!, id: user.id!, image: user.photo ?? Constants.imageStatic);
              Navigator.pushNamed(context, RoutesManager.chatBodyScreen,arguments: n);
              // Navigator.pushNamed(
              //   context,
              //   RoutesManager.profileScreen,
              //   arguments: DataToProfileAsVisitor(
              //     isVisitor: (consultant.id != CachHelper.getId()),
              //     id: consultant.id,
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
