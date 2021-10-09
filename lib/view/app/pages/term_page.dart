import 'package:Estimatewale/view/helpers/colors.dart';
import 'package:Estimatewale/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditionPage extends StatelessWidget {
  const TermsConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "EstimateWale",
          style: GoogleFonts.poppins(
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                height: height / 4.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/login-art.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "Terms & Conditions",
                  style: GoogleFonts.poppins(
                    color: dimGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TermsText(
                      txt:
                          "© [2021] Copyright [Estimatewale Pvt Ltd ]. [2021]. All rights reserved. Reproduction, adaptation, or translation without permission is prohibited except as allowed under the International copyright laws. All the text, graphics, design, content, and other works are the copyrighted works of [Estimatewale Pvt Ltd].",
                    ),
                    SizedBox(height: 25),
                    SecondLabel(label: "TERMS AND CONDITIONS OF USE"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Welcome to the corporate/ official website of [Estimatewale Pvt Ltd] ([www.estimatewale.com]). Use of this site is governed by the Terms and Conditions set forth. PLEASE READ THESE TERMS AND CONDITIONS CAREFULLY BEFORE USING THIS WEBSITE. The information and materials provided by [Estimatewale Pvt Ltd] may be used for informational purposes only. By using, accessing or downloading materials from this website you agree to follow the terms and provisions as outlined in this legal notice, which apply to all visits to the [Estimatewale Pvt Ltd] website, both now and in the future. [Estimatewale Pvt Ltd] may at any time revise and update the Terms and Conditions. You are encouraged to periodically visit this page to review the most current Terms and Conditions to which you are bound. If you do not agree to these Terms and Condition of Use, please do not use this website."),
                    SizedBox(height: 8),
                    TermsText(
                        txt:
                            "* The price we will give you is just an estimate, exact repair cost will be confirmed at the repair shop after the initial diagnoses. Price may vary according to your location and depends upon quality and availability of spares. This estimate price is only for compatible spares."),
                    SizedBox(height: 25),
                    SecondLabel(label: "RESTRICTIONS"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "You may view, download and copy information and materials available on this website solely for your personal, non-commercial use. You may also use such material within your organization in connection with the support of [Estimatewale Pvt Ltd]'s products. As a condition of use, you agree not to modify or revise any of the material in any manner, and to retain all copyright and other proprietary notices as contained in the original materials on any copies of the materials. No other use of the materials or information is authorized. Any violation of the foregoing may result in civil and/or criminal liabilities. "),
                    SizedBox(height: 25),
                    SecondLabel(
                        label: "OWNERSHIP OF INFORMATION AND MATERIALS"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The information and any materials (including white papers, press releases, data sheets, product descriptions, and FAQs) available on or from this website are the copyrighted works of [Estimatewale Pvt Ltd], and any unauthorized use of that information or materials may violate copyright, trademark and other laws. "),
                    SizedBox(height: 8),
                    TermsText(
                        txt:
                            "Any rights not expressly granted herein are reserved."),
                    SizedBox(height: 25),
                    SecondLabel(label: "TRADEMARK INFORMATION"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "[Estimatewale]'s trademarks may be used only with written permission from [Estimatewale Pvt Ltd]. [Estimatewale], [PRODUCT], and [BRAND] are registered trademarks or trademarks of [Estimatewale Pvt Ltd]. All other trademarks, brands, and names are the property of their respective owners. Except as expressly specified in these terms and legal restrictions, nothing contained herein shall be construed as conferring by implication, estoppel or otherwise any license or right under any patent, trademark, copyright or any proprietary rights of [Estimatewale Pvt Ltd] or any third party."),
                    SizedBox(height: 25),
                    SecondLabel(label: "LINKS TO OTHER WEBSITES"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "As a convenience and to make the [Estimatewale] website truly service oriented we have included links to complementary sites on the Internet. These sites are owned and operated by third parties. [Estimatewale Pvt Ltd] makes no representation and is not responsible for the availability of, or content located on or through, these third-party sites. A third-party link from the [Estimatewale] website is not an indication that [Estimatewale Pvt Ltd] endorses the third party or its site, or has any affiliation with or between [Estimatewale Pvt Ltd] and the third-party hosting site."),
                    SizedBox(height: 25),
                    SecondLabel(label: "FEEDBACK "),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "All comments, feedback, information or materials submitted to [Estimatewale Pvt Ltd] through or in association with this website shall be considered non-confidential and [Estimatewale Pvt Ltd]'s property. By submitting such comments, information, feedback, or materials to [Estimatewale Pvt Ltd], you agree to a no-charge assignment to [Estimatewale Pvt Ltd] of worldwide rights to use, copy, modify, display and distribute the submissions. [Estimatewale Pvt Ltd] may use such comments, information or materials in any way it chooses in an unrestricted basis."),
                    SizedBox(height: 25),
                    SecondLabel(label: "DISCLAIMER"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The price which estimatewale.com will give you is just an estimate; exact repair cost will be confirmed at the repair shop after the initial diagnosis. As a company, brand or website Estimatewale.com will not responsible for if any mobile dealer, shopkeeper or any verified dealer is deny to repair your mobile or damage your mobile or loss your mobile data. Estimatewale.com as a website or Estimatewale Pvt Ltd as a company will not responsible if any kind of dispute raised between customer and dealers. The repair estimate or any spares estimate or any display change estimate given by estimatewale.com is only for compatible spares or for compatible display. All mobile Brands are registered trademarks  or one of their listed subsidiaries. Estimatewale.com or Estimatewale Pvt Ltd does not own the trademarks of any mobile brand. We use these trademarks only to the extent necessary for our customers to identify whether certain repair or replacement parts are appropriate for the products owned by our customers."),
                    SizedBox(height: 8),
                    TermsText(
                        txt:
                            "* The price we will give you is just an estimate, exact repair cost will be confirmed at the repair shop after the initial diagnoses. Price may vary according to your location and depends upon quality and availability of spares. This estimate price is only for compatible spares."),
                    SizedBox(height: 8),
                    TermsText(
                        txt:
                            "The information provided by estimatewale.com on its YouTube channel (estimatewale) is for general informational purposes only. All information on this channel is provided in good faith, however we make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability or completeness of any information on this channel. Under no Circumstances shall we have any Liability to you for any loss or damage of any kind Incurred as a result of the use of this channel or reliance on any information provided on this channel. Your use of this channel and your reliance on any information on this channel is solely at your own risk. The [Estimatewale Pvt Ltd] Internet team strives to provide you with useful, accurate, and timely information on this website. Accordingly, [Estimatewale Pvt Ltd] has attempted to provide accurate information and materials on this website but assumes no responsibility for the accuracy and completeness of that information or materials. [Estimatewale Pvt Ltd] may change the content of any information or materials available at this website, or to the products described in them, at any time without notice. However, [Estimatewale Pvt Ltd] makes no commitment to update the information or materials on this website which, as a result, may be out of date. Information and opinions expressed in bulletin boards or other forums are not necessarily those of [Estimatewale Pvt Ltd]. Neither [Estimatewale Pvt Ltd], nor its officers, directors, employees, agents, distributors, or affiliates are responsible or liable for any loss damage (including, but not limited to, actual, consequential, or punitive), liability, claim, or other injury or cause related to or resulting from any information posted on [Estimatewale Pvt Ltd]'s website. [Estimatewale Pvt Ltd] reserves the right to revise these terms and/or legal restrictions at any time. You are responsible for reviewing this page from time to time to ensure compliance with the then-current terms and legal restrictions because they will be binding on you. Certain provisions of these terms and legal restrictions may be superseded by expressly designated legal notices or terms located on particular pages of this website."),
                    SizedBox(height: 8),
                    TermsText(
                        txt:
                            "ALL INFORMATION AND MATERIALS AVAILABLE AT THIS WEBSITE ARE PROVIDED AS IS WITHOUT ANY WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND [Estimatewale Pvt Ltd] DISCLAIMS ALL WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT OF INTELLECTUAL PROPERTY OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE. IN NO EVENT SHALL [Estimatewale Pvt Ltd] BE LIABLE FOR ANY DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, INDIRECT, SPECIAL, CONSEQUENTIAL OR INCIDENTAL DAMAGES OR THOSE RESULTING FROM LOST PROFITS, LOST DATA OR BUSINESS INTERRUPTION) ARISING OUT OF THE USE, INABILITY TO USE, OR THE RESULTS OF USE OF THIS WEBSITE, ANY WEBSITES LINKED TO THIS WEBSITE, OR THE MATERIALS OR INFORMATION CONTAINED AT ANY OR ALL SUCH WEBSITES, WHETHER BASED ON WARRANTY, CONTRACT, TORT OR ANY OTHER LEGAL THEORY AND WHETHER OR NOT ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. IF YOUR USE OF THE MATERIALS OR INFORMATION ON THIS WEBSITE RESULTS IN THE NEED FOR SERVICING, REPAIR OR CORRECTION OF EQUIPMENT OR DATA, YOU ASSUME ALL COSTS THEREOF. "),
                    SizedBox(height: 25),
                    SecondLabel(label: "TERMINATION OF USE"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "[Estimatewale Pvt Ltd] may, in its sole discretion, terminate or suspend your access to all or part of the [Estimatewale Pvt Ltd] website, including, but not limited to any bulletin boards on its site, for any reason, including without limitation, breach of this agreement. In the event this agreement is terminated, the restrictions regarding materials appearing on the site and the representations and warranties, indemnities, and limitation of liabilities set forth in this agreement shall survive any such termination."),
                    SizedBox(height: 25),
                    SecondLabel(label: "GOVERNING LAW; JURISDICTION AND VENUE"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "This Agreement shall be governed by and construed in accordance with the laws of the [PUNJAB] of [INDIA]. The [LUDHIANA/PUNJAB] courts shall have exclusive jurisdiction and venue over any dispute arising out of or relating to this Agreement, and each party hereby consents to the jurisdiction and venue of such courts."),
                    SizedBox(height: 25),
                    SecondLabel(label: "GENERAL PROVISIONS"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "If any provision of this agreement is deemed void, unlawful or otherwise unenforceable for any reason, that provision shall be severed from this agreement and the remaining provisions of this agreement shall remain in force. This contains the entire agreement between you and [Estimatewale Pvt Ltd] concernIng your use of the site, and the agreement shall not be modified, except in writing, signed by both parties. If you have questions regarding [Estimatewale Pvt Ltd]'s Terms and Conditions, please email: [estimatewale@gmail.com] or read the Privacy Policy."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
