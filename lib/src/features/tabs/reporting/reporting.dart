import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:health_device/src/shared/widgets/appButton.dart';
import 'package:health_device/src/shared/widgets/theme_card.dart';

class ReportingScreen extends StatefulWidget {
  static final path = '/reporting';
  const ReportingScreen({super.key});

  @override
  State<ReportingScreen> createState() => _ReportingScreenState();
}

class _ReportingScreenState extends State<ReportingScreen> {
  final Widget _verticalSpacer = SizedBox(height: 15.h);

  String? selectedValue;
  final List<String> items = [ 'Travel', 'Meals','Supplies'];

  String? selectedProductTypes;
  final List<String> productTypes = [ 'Smart Home Suite 2025', 'IoT Bundle','Security Package'];

  @override
  Widget build(BuildContext context) {
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
                          "Daily Sales Report",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        Text(
                          "Number of Sales",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "", // Only specify hint text, other styles come from theme
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Product Type",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withValues(alpha: 0.4),
                              width: 1,
                            ), // 1px gray border
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child:  DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Padding(padding: EdgeInsets.only(left: 10),child: const Text("Select product")),
                              value: selectedProductTypes,

                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedProductTypes= newValue;
                                });
                              },
                              items:
                              productTypes.map<DropdownMenuItem<String>>((
                                  String value,
                                  ) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(value)),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Total Revenue (\$)",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "", // Only specify hint text, other styles come from theme
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        AppButton(
                          title: 'Submit Sales Report',
                          padding: 12,
                          size: 16,
                          onTap: () {
                            // context.push(TabsScree.path);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
                          "Customer & Reimbursement",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        _verticalSpacer,
                        Text(
                          "Customer Name",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "", // Only specify hint text, other styles come from theme
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Customer Email",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "", // Only specify hint text, other styles come from theme
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Expense Type",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withValues(alpha: 0.4),
                              width: 1,
                            ), // 1px gray border
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child:  DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                child: const Text("Select type"),
                              ),
                              value: selectedValue,
                            
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              items:
                                  items.map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(value)),
                                    );
                                  }).toList(),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),
                        Text(
                          "Amount (\$)",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText:
                                  "", // Only specify hint text, other styles come from theme
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        AppButton(
                          title: 'Submit Reimbursement',
                          padding: 12,
                          size: 16,
                          onTap: () {
                            // context.push(TabsScree.path);
                          },
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
}
