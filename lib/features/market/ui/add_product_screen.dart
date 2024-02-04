import 'package:final_project/core/theming/color_helper.dart';
import 'package:final_project/core/theming/text_style_helper.dart';
import 'package:final_project/core/widgets/custom_app_bar.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/add_item_image.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/item_info.dart';
import 'package:final_project/features/market/ui/add_product_screen/widget/item_type_list.dart';
import 'package:final_project/core/widgets/action_buttons.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: 'بيع منتجك',
        background: ColorHelper.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                bottom: 8,
                left: 16,
                right: 16,
              ),
              child: Text(
                'نوع المنتج',
                style: TextStyleHelper.font16BoldDarkestGreen,
              ),
            ),
            const ItemTypeList(),
            const SizedBox(height: 12),
            const ItemInfo(
              label: 'اسم المنتج',
              isMultiLine: true,
              height: 40,
            ),
            const ItemInfo(
              label: 'المكان',
              isMultiLine: true,
              height: 40,
            ),
            const ItemInfo(
              label: 'الوصف',
              isMultiLine: true,
              height: 40,
            ),
            const Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ItemInfo(
                    label: 'سعر الواحد',
                    height: 40,
                    keyBordTyp: TextInputType.numberWithOptions(
                        decimal: true
                    ),
                    isMultiLine: false,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 0
                    )),
                Expanded(
                  flex: 5,
                  child: ItemInfo(
                    label: 'العملة',
                    height: 40,
                    //keyBordTyp: TextInputType.numberWithOptions(
                    //    decimal: true
                    //),
                    isMultiLine: false,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ItemInfo(
                    label: 'العدد',
                    height: 40,
                    keyBordTyp: TextInputType.numberWithOptions(
                        decimal: true
                    ),
                    isMultiLine: false,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 0
                    )),
                Expanded(
                  flex: 5,
                  child: ItemInfo(
                    label: 'وحدة القياس',
                    height: 40,
                    // keyBordTyp: TextInputType.numberWithOptions(
                    //     decimal: true
                    // ),
                    isMultiLine: false,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ItemInfo(
                    label: 'الخصم ان وجد',
                    height: 40,
                    keyBordTyp: TextInputType.numberWithOptions(
                        decimal: true
                    ),
                    isMultiLine: false,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 0
                    )),
                Expanded(
                  flex: 5,
                  child: ItemInfo(
                    label: 'السعر بعد الخصم',
                    height: 40,
                    keyBordTyp: TextInputType.numberWithOptions(
                        decimal: true
                    ),
                    isMultiLine: false,
                  ),
                ),
              ],
            ),
            const AddItemImage(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                vertical: 20
              ),
              child: ActionButton(
                onTap: () {},
                label: 'نشر الأن',
                outerColor: ColorHelper.primaryColor,
                labelColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
