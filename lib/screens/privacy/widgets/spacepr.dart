import 'package:flutter/material.dart';
import 'package:money_management/db/constants/color.dart';


Widget spacePrivacy(){
  return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: plain,
                ),
                height: 550,
                width: 340,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 530,
                    width: 300,
                    child: ListView(
                      children: const [
                        Text("""
                  PRIVACY POLICY FOR \n                        'BudgetBuddy'

We are committed to protecting your privacy. This privacy policy sets out how we use and protect any information that you give us when you use our money management mobile app.

We may collect the following information:

1. Personal information such as name, email address, and phone number
2. Transaction data such as account balances, income, and expenses
3. Usage data such as app activity and preferences

We collect this information to provide money management services and to improve the functionality of our app. We are committed to ensuring that your information is secure. We use industry-standard encryption to protect your financial data and personal information.

We may share your information with third-party service providers, such as banks and payment processors, in order to provide money management services. We may also share your information with third-party analytics providers to improve the functionality of our app. We will not sell, rent, or lease your information to third parties.

We may use your information to send you promotional emails about our products and services or other information which we think you may find interesting. You may opt out of receiving these emails at any time by clicking the unsubscribe link at the bottom of the email.

You may request to access, modify, or delete your information at any time by contacting us. We will respond to your request within a reasonable timeframe.

We may update this privacy policy from time to time by posting a new version on our website. You should check this page periodically to ensure that you are happy with any changes.

If you have any questions about this privacy policy or how we use your information, please contact us.
                        """,
                        style: TextStyle(
                          color: prColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                        )
                      ],
                    )
                  ),
                ),
              );
}