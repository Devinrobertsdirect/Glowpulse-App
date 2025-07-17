import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_device/src/config/router.dart';
import 'package:health_device/src/config/theme.dart';
import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';

class InventoryScreen extends ConsumerWidget {
  static final path = '/inventory';
  InventoryScreen({super.key});
  final Widget _verticalSpacer = SizedBox(height: 15.h);
  final double _textFieldPadding = 15;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [boxShadowWidget()],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Inventory",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 10,),
                        _inventoryWidget(),

                        AppButton(
                          title: 'Update inventory count',
                          onTap: () {
                            // context.push(TabsScreen.path);
                          },
                          padding: 9,
                          size: 14,
                          // planColor: true,
                          // icon: Icon(
                          //   Icons.local_shipping_outlined,
                          //   color: Colors.white,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                _verticalSpacer,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [boxShadowWidget()],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping Information",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Tracking Number",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "Enter tracking Number", // Only specify hint text, other styles come from theme
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Shipping Cost (\$)",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter Shipping Cost",
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Recipient Name",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter recipient's full name",
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Arrival Address",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter complete shipping address",
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                              contentPadding: EdgeInsets.all(_textFieldPadding),
                            ),
                            maxLines: 5,

                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 20),
                        AppButton(
                          title: 'Submit shipping information',
                          onTap: () {
                            // context.push(TabsScreen.path);
                          },
                          padding: 9,
                          size: 14,
                          // planColor: true,
                          // icon: Icon(
                          //   Icons.local_shipping_outlined,
                          //   color: Colors.white,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                _verticalSpacer,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [boxShadowWidget()],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reorder Products (St. Louis Office)",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Recipient Name",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter recipient's name",
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Recipient Address",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Enter complete address",
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                              contentPadding: EdgeInsets.all(_textFieldPadding),
                              // Only specify hint text, other styles come from theme
                            ),
                            maxLines: 5,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Products to Reorder",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 10),
                        _recordProductRow('Smart Home Suite 2025'),
                        _recordProductRow('IoT Bundle'),
                        _recordProductRow('Security Package'),
                        _recordProductRow('Smart Thermostat'),
                        _recordProductRow('Video Doorbell'),
                        SizedBox(height: 10),
                        Text(
                          "Additional Information",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "Enter any additional information about the order...",
                              hintStyle:
                                  Theme.of(
                                    navigatorKey.currentContext!,
                                  ).textTheme.bodyLarge,
                              contentPadding: EdgeInsets.all(_textFieldPadding),
                              // Only specify hint text, other styles come from theme
                            ),
                            maxLines: 5,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 20),
                        AppButton(
                          title: 'Submit shipping information',
                          onTap: () {
                            // context.push(TabsScreen.path);
                          },
                          padding: 9,
                          size: 14,
                          // planColor: true,
                          // icon: Icon(
                          //   Icons.local_shipping_outlined,
                          //   color: Colors.white,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _recordProductRow(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Text(
            title,
            style: Theme.of(
              navigatorKey.currentContext!,
            ).textTheme.bodyMedium!.copyWith(
              color: AppTheme.textBlackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Quantity",
                hintStyle:
                    Theme.of(navigatorKey.currentContext!).textTheme.bodyLarge,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }

  Widget _inventoryWidget() {
    return Column(
      children: [
        _inventoryHeader(),
        _inventoryDataRow(
          'Smart Home Suite 2025',
          '45 units',
          'Good',
          'Warehouse A',
        ),
        _inventoryDataRow('IoT Bundle', '12 units', 'Low', 'Warehouse B'),
        _inventoryDataRow(
          'Security Package',
          '28 units',
          'Medium',
          'Warehouse A',
        ),
      ],
    );
  }

  Widget _inventoryDataRow(
    String product,
    String stock,
    String status,
    String location,
  ) {
    final titleStyle = Theme.of(navigatorKey.currentContext!)
        .textTheme
        .bodySmall!
        .copyWith(fontWeight: FontWeight.w500, color: AppTheme.textBlackColor);
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(product, style: titleStyle),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(stock, style: titleStyle),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color:

                  status.toLowerCase()=='good'?Colors.green:
                      status.toLowerCase()=='low'?Colors.red
                      :Colors.yellow,
                  borderRadius: BorderRadius.circular(50)
                  ),
                  height: 6,
                  width: 6,
                  margin: EdgeInsets.only(right: 5),
                ),
                Text(status, style: titleStyle),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(location, style: titleStyle),
          ),
        ],
      ),
    );
  }

  Widget _inventoryHeader() {
    final titleStyle = Theme.of(navigatorKey.currentContext!)
        .textTheme
        .bodySmall!
        .copyWith(fontWeight: FontWeight.w700, fontSize: 12.sp);
    return Container(
      decoration: BoxDecoration(color: AppTheme.tableHeaderBg),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text('Product', style: titleStyle),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text('Stock\nLevel', style: titleStyle),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text('Status', style: titleStyle),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text('Location', style: titleStyle),
          ),
        ],
      ),
    );
  }
}
