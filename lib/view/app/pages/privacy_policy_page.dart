import 'package:fix_team_app/view/helpers/colors.dart';
import 'package:fix_team_app/view/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

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
                  "Privacy Policy",
                  style: GoogleFonts.poppins(
                    color: dimGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TermsText(
                        txt:
                            "This Privacy Policy sets out the basis on which information collected from the users or provided by the users is processed by us, [Estimatewale Pvt Ltd.], a company incorporated under the laws of India and having its registered office at [SHOP NO. 235/1, VIDEO MARKET CIVIL STREET, GHUMAR MANDI CHOWK LUDHIANA Ludhiana PB 141001 IN.] IN and/or its subsidiary(ies) and/or affiliate(s) (collectively hereinafter referred to as the “estimatewale pvt Ltd”), which operates various websites, apps, newsletters and other services including but not limited to delivery of information and content via any mobile or internet connected device or otherwise (collectively the “Service(s)”)."),
                    SizedBox(height: 8),
                    TermsText(
                        txt:
                            "This Privacy Policy forms part and parcel of the Terms of Use for the Services. Capitalized terms which have been used here but are undefined shall have the same meaning as attributed to them in the Terms of Use. The Company respects the privacy of the users of the Services and is committed to protect it in all respects."),
                    SizedBox(height: 25),
                    SecondLabel(
                        label:
                            "1. INFORMATION RECEIVED, COLLECTED AND STORED BY THE COMPANY"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "We collect and process some or all of the following type of information in the course of you using our Services. The type of information we collect will depend on the circumstances and the Service you are using. Generally speaking, the information about the user as collected by the Company is: (a) data supplied by users and (b) data automatically tracked while navigation (c) data collected from any other source (collectively referred to as “Information”)."),
                    SizedBox(height: 10),
                    LabelText(label: "(a). Information Supplied by Users"),
                    SizedBox(height: 5),
                    ThirdLabel(label: "(i) Registration Data"),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "This Information includes, but is not limited to, basic contact information provided by you on our Website, which may include your name, mobile number, address, e-mail address, data of birth, demographical information, gender, interests, preferences, place of work, position, country. For example, the Company may collect personal Information when you register on the Website, to subscribe to our Services or for requesting further information. It can also include information that we have not requested but which you have volunteered, such as information provided during interactions via comments or other submissions you have made to our online Services, such as online forums, in response to a survey, while requesting certain Services or products, or to enter a sweepstakes, contest, or other promotion."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                      ),
                      child: TermsText(
                          txt:
                              "When you register using your other accounts like on Facebook, Twitter, Gmail etc. we shall retrieve Information from such account to continue to interact with you and to continue providing the Services."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                      ),
                      child: TermsText(
                          txt:
                              "The Company may use your Information to provide you with information, special offers, and promotions via various means including e-mail. You may instruct Company at any time not to use your personal Information covered by this Privacy Policy to provide you with special offers and promotions."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                      ),
                      child: TermsText(
                          txt:
                              "In case you choose to decline to submit personal Information on the Website, the Company may not be able to provide certain sites / content / apps / services / features to you. We will make reasonable efforts to notify you of the same at the time of opening your account. In any case, we will not be liable and or responsible for the denial of certain services to you for lack of you providing the necessary personal Information."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(label: "(ii) Subscription or Paid Service Data"),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "You may choose to purchase any subscription or paid Service using a credit card, e-wallet or any other electronic payment system. When you chose any subscription or paid Service, we or our payment system provider may collect your purchase, address or billing information, including your credit card number and expiration date, etc. (“Payment Information”). However, when you order using an in-app purchase option, same are handled by such platform providers. Typically, the Payment information is provided directly by users, via the Website, into the PCI/DSS-compliant payment processing service to which the Company subscribes, and the Company does not, itself, process or store the Payment Information, except as stated herein."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                      ),
                      child: TermsText(
                          txt:
                              "The subscriptions or paid Services may be on auto renewal mode unless cancelled. If at any point you do not wish to auto-renew your subscription, you may cancel your subscription before the end of the subscription term."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                      ),
                      child: TermsText(
                          txt:
                              "This Payment Information is used to provide you your requested Services, to manage your account, to communicate with you, and enforce any terms of service or agreement related to the Website. We use any Payment Information we acquire from you only to fulfil your order."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(
                        label: "(iii) Information about other Individuals"),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                      ),
                      child: TermsText(
                          txt:
                              "In some circumstances you might provide us with the Information about other individuals, you must ensure that you (1) have their permission to provide their Information to us; and (2) you have made them aware of the terms of this Privacy Policy. By submitting the Information about others, you represent and warrant that you are authorized to do so and that you have received authorization from the person about whom you are providing the Information and that person has explicitly consented to have all Information used, processed, disclosed, and transferred in accordance with this Privacy Policy."),
                    ),
                    SizedBox(height: 16),
                    LabelText(
                        label:
                            "(b) Information automatically tracked while navigation"),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: TermsText(
                          txt:
                              "When you use our Services, we automatically record Information about your usage of those Services, your interaction with our emails as well as information about the device you are using and your internet connection. We do this in the following ways:"),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(
                        label: "(i) Use of Cookies and other Electronic Tools"),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "The Company and the parties with whom we work (e.g., business partners, advertisers and advertising servers) may place, view, and/or use “cookies”, web server logs, web beacons, or mapping pixel/pixel tag or other electronic tools to collect statistical and other Information about your use of the Website and other websites. This Information may include information about the IP address of your computer, browser type, language, operating system, your mobile device, geo-location data, the state or country from which you accessed the Company’s Website, the web pages visited, the date and the time of a visit, the websites you visited immediately before and after visiting the Website, the number of links you click within the Website, the functions you use on the Website, the databases you view and the searches you request on the Website, the data you save on or download from the Website and the number of times you view an advertisement. "),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "For more information, please see our Cookies Policy, which forms part of this Privacy Policy and the Terms and Conditions of the Website."),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "The Company and the parties with whom we work may use the information collected for various reasons, either on behalf of Company or for the other parties’ own purposes, including research, analysis, to better serve visitors to the Website (such as by providing customized content, or presenting online advertising on the Website or other websites tailored to your interests as described further below), to compile aggregate and anonymous information about usage of the Website and other websites, other statistics, etc. However, if you have deleted and disabled cookies, these uses will not be possible to the extent they are based on cookie information. This is statistical data about our users browsing actions and patterns and does not identify any individual. However, to assist us with the uses described in this Privacy Policy, information collected about your use of the Website or other websites may be combined with personal or other Information about you from other online or offline sources to track usage of our Services."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(label: "(ii) Log File Information"),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "We automatically collect limited information about your computer’s connection to the Internet, mobile number, etc., when you visit the Website / Service. We automatically receive and log information from your browser, including your computer’s name, your operating system, browser type and version, IP address, CPU speed, and connection speed. We may also collect log information from your device, including your location, IP address, your device’s name, device’s serial number or unique identification number (e.g. UDiD on your iOS device). If you access the Services from a mobile or other device, we may collect a unique device identifier assigned to that device, geo-location data, or other transactional information for that device."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(label: "(iii) Clear GIFs"),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "Besides web beacons, we may also use clear GIFs in HTML-based emails sent to our users to track which emails are opened by recipients. We use this information to inter-alia to measure traffic within the Website / Service to improve the Website / Service quality, functionality and interactivity and let advertisers know the geographic locations from where our visitors come."),
                    ),
                    SizedBox(height: 16),
                    LabelText(
                        label:
                            "(c) Information collected from any other source"),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TermsText(
                          txt:
                              "We may receive Information about you from other sources, add it to our account information and treat it in accordance with this Privacy Policy. If you provide Information to the platform provider or other partner, your account information and order information may be passed on to us. We may obtain updated contact information from third parties in order to correct our records and fulfill the Services or to communicate with you and you expressly consent to this."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(
                        label:
                            "(i) Information from other Sources: Demographic & Purchase Information"),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TermsText(
                          txt:
                              "We may reference other sources of demographic and other information in order to provide you with more targeted communications and promotions. We use analytical tools to track the user behaviour on our Website. These tools have been enabled to support display advertising towards helping us gain understanding of our users’ demographics and interests."),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: TermsText(
                          txt:
                              "The reports are anonymous and cannot be associated with any individual personally identifiable Information that you may have shared with us."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(
                        label: "(ii)Advertisements& Purchase Information"),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: TermsText(
                          txt:
                              "The Company or third-party advertisers or their advertising servers may also place or recognize unique cookies on your computer or use other electronic tools in order to help display advertisements that you see on the Website or on other websites. Information about your visits to, and activity on, the Website and other websites, an IP address, the number of times you have viewed an advertisement, and other such usage information is used, alone or in combination with other information, to display on your device screen advertisements that may be of particular interest to you. We may use web beacons, provided by third-party advertising companies, to help manage and optimize our online advertising and product performance. Web beacons enable us to recognize a browser’s cookie when a browser visits this Website, and to learn which banner ads bring users to this Website. The use and collection of your Information by these third-party service providers, and third-party advertisers and their advertising servers is not covered by this Privacy Policy."),
                    ),
                    SizedBox(height: 25),
                    SecondLabel(label: "2. INFORMATION USE BY THE COMPANY"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "We use Information held about you for our legitimate business interests for the following purposes:"),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TermsText(
                              txt:
                                  "(i) To provide you Services including associated functionalities whether by us or by our designated representatives and/or business partners to you or to parties designated by you and any and all matters ancillary thereto including to carry out obligations from any contracts entered into between us. We rely on performance of our contract with you so as the legal basis for such processing;"),
                          SizedBox(height: 8),
                          TermsText(
                              txt:
                                  "(ii) To verify and process payment when you subscribe to, purchase and/or obtain Services from any of our Website. We rely on performance of our contract with you so as the legal basis for such processing;"),
                          SizedBox(height: 8),
                          TermsText(
                              txt:
                                  "(iii) For verification and record of your personal particulars, to authenticate you so that we know it is you and not someone else which includes comparing it with Information from other sources and using the Information to communicate with you. We rely on performance of our contract with you so as the legal basis for such processing;"),
                          SizedBox(height: 8),
                          TermsText(
                              txt:
                                  "(iv) To conduct market research and statistical analysis of the users of the Website including the number of users, the frequency of use, profile of users and using such analysis for our business plans, the enhancement of our products and services, targeted advertisements and conveying such Information in broad terms (but not information in relation to specific individuals) to third parties who have or propose to have business dealings with us. We rely on legitimate business interests as the legal basis for such processing and the legitimate interest is the analyzing the use of the Services and improving the same;"),
                          SizedBox(height: 8),
                          TermsText(
                              txt:
                                  "(v) To send you Information, promotions and updates including marketing and advertising materials in relation to our Services and those of third party organizations selected by us. We will only do this where we reasonably believe that our Services may be of interest to you and you consent to being provided with such information. We rely on legitimate business interest as the legal basis to promote our Services to you as the legal basis for this processing;"),
                          SizedBox(height: 8),
                          TermsText(
                              txt:
                                  "(vi) To prevent fraud or other potentially illegal activities (including copyright infringement) and to block disruptive users and protect the safety of users of our Services. The legal basis for this processing is our legitimate business interests being the proper protection of our business against risks and"),
                          SizedBox(height: 8),
                          TermsText(
                              txt:
                                  "(viii) To enforce our terms of Service. The legal basis for this processing being the protection and assertion of our legal rights and the legal rights of others."),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    TermsText(
                        txt:
                            "In any case, if you would prefer that we do not use your Information to market or promote our products and Services to you, please either (i) tick the relevant box on the form through which we collect your Information (for example, the registration form); (ii) unsubscribe from our electronic communications using the method indicated in the relevant communication; or (iii) contact us at our email address."),
                    SizedBox(height: 8),
                    TermsText(txt: "[estimatewale@gmail.com]"),
                    SizedBox(height: 25),
                    SecondLabel(label: "3. Sensitive Personal Information"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Unless specifically requested, we ask that you not send us, and you shall not disclose, on or through the Services or otherwise to us, any sensitive personal information (e.g., information related to racial or ethnic origin, political opinions, religion, ideological or other beliefs, health, biometrics or genetic characteristics, national identification numbers, social security numbers, criminal background, trade union membership, or administrative or criminal proceedings and sanctions)."),
                    SizedBox(height: 25),
                    SecondLabel(
                        label:
                            "4. DISCLOSURE OF PERSONAL INFORMATION AND OTHER INFORMATION"),
                    SizedBox(height: 16),
                    ThirdLabel(
                        label:
                            "(a)Information Shared with Group Companies and Affiliates"),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TermsText(
                          txt:
                              "The Company may share Information with its employees, agents, officers, group companies, the employees, agents and officers of such group companies and our affiliates (including affiliated websites under common ownership or control) for the purpose of processing Information on its behalf."),
                    ),
                    SizedBox(height: 12),
                    ThirdLabel(
                        label:
                            "(b)Information shared with Third Parties and Sponsors"),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 32,
                        right: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TermsText(
                              txt:
                                  "(i) The Company may share with other third parties Information about our Website users, such as your use of the Website or other websites, and the Services provided on the Website or other websites, but only on an anonymous and aggregate basis to help us develop content, services, and advertising that we hope you will find of interest. The Company may also share your Information with a sponsor or other third party (“Third-Party Provider”) to perform Site-related services, including database management, maintenance services, analytics, marketing, data processing, and email and text message distribution. These third parties have access to your Information only to perform these tasks only on our behalf."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "(ii) The Company may share Information to support sponsors. If you participate in certain features of the Website (e.g., sharing news stories of interest), please note that any Information you or others voluntarily disclose through use of these features, becomes available to the public and/or other users whom you have designated. The Company is not responsible for the Information that you or others choose to disclose publicly on the Website, and neither the Company’s nor others’ use of such Information is subject to this Privacy Policy."),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "(c)Information shared via third party social buttons, widgets and other embedded content. Some of our online services carry embedded content controlled by third parties for services such as social sharing, recommended stories, commenting/reviewing, and displaying video or images. When you interact with these services they may collect information from and about you and your interaction with their content. This activity will be subject to the Privacy Policy of and your settings for your chosen network. Please be aware that they may track your activity, through the use of cookies or similar technology, without you needing to interact with them. If this concerns you, ensure you log out of their services before using ours."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "Further, we use third-party advertising companies to serve ads when you visit or use the Website or Services. These companies may use Information (not including your name, address, email address or telephone number) about your visits or use to particular website, mobile application or services, in order to provide advertisements about goods and services of interest to you."),
                          SizedBox(height: 26),
                          SecondLabel(
                              label:
                                  "(d)Information shared with Other Parties"),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "The Company may also disclose your personal and other Information to unaffiliated third parties if we believe in good faith that such disclosure is necessary: (i) to comply with the law or in response to a subpoena, court order, search warrants, judicial proceedings, other legal process, or other law enforcement measures, to establish or exercise our legal rights, or to defend against legal claims; (ii) to protect the interests, rights, safety, or property of the Company or others; (iii) to enforce any terms of service on the Website; (iv) to investigate, prevent, or take action regarding illegal activities, suspected fraud, situations involving potential, or as otherwise required by law; (v) to provide you and other users of the Website with the Services or products requested by you and/or the other users, and to perform other activities related to such Services and products, including billing and collection; (vi) to provide you with special offers or promotions from the Company that may be of interest to you; or (vii) to operate the Company’s systems properly."),
                          SizedBox(height: 26),
                          SecondLabel(
                              label:
                                  "(e) The Company may present Information to allow social sharing functionality. "),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "If you log in with or connect a social media service account with Services, we may share your user name, picture, and likes, as well as your activities and comments with other Services users and with your friends associated with your social media service. We may also share the same Information with the social media service provider. By logging in with or connecting your Services account with a social media service, you are authorizing us to share Information we collect from and about you with the social media service provider, other users and your friends and you understand that the social media services use of the shared Information will be governed by the social media services privacy policy. If you do not want your personal Information shared in this way, please do not connect your social media service account with your Services account and do not participate in social sharing on Services."),
                          SizedBox(height: 26),
                          SecondLabel(
                              label:
                                  "(f) Sale or Transfer of all or part of Business of Company"),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "If the Company sells all or part of its business or makes a sale or transfer of its assets or is otherwise involved in a merger or transfer of all or a material part of its business, the Company may transfer your Information to the party or parties involved in the transaction as part of that transaction."),
                          SizedBox(height: 26),
                          TermsText(
                              txt:
                                  "(g) In addition to the scenarios identified above, we may share Information about you for any other purposes disclosed to you at the time we collect your Information or pursuant to your consent."),
                          SizedBox(height: 26),
                          SecondLabel(
                              label:
                                  "(h) Some General Exceptions to Disclosures"),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TermsText(
                                    txt:
                                        "a) The Website Service may include links to other websites or applications. Such websites or applications are governed by their respective privacy policies, which are beyond our control. Once you leave our servers (you can tell where you are by checking the URL in the location bar on your browser), use of any information you provide is governed by the privacy policy of the operator of the website / app / service you are visiting. That policy may differ from ours. If you can’t find the privacy policy of any of these via a link, you should contact the application / site owners directly for more information."),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "The collection, further use, and/or disclosure of your Information by Third-Party Providers or by other third parties is not the responsibility of the Company. Rather, such collection, use, and/or disclosure is governed by the Third-Party Providers’ privacy policies."),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "b) Any personally identifiable Information provided by you will not be considered as sensitive if it is freely available and / or accessible in the public domain like any comments, messages, blogs, scribbles available on social platforms like Facebook, Twitter etc."),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "c) Anything posted / uploaded / conveyed / communicated by users in the websites / apps / services becomes published content and is not considered personally identifiable information subject to this Privacy Policy."),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "The above exceptions are not exhaustive and will include exceptions available in law as well as otherwise."),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    SecondLabel(label: "5. SECURITY OF PERSONAL INFORMATION"),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: Column(
                        children: [
                          TermsText(
                              txt:
                                  "Any personal Information you provide to Company is kept on secure servers with limited access. The Company uses reasonable administrative, technical, personnel, and physical measures (a) to safeguard personal Information against loss, theft, unauthorized use or access, disclosure, or modification; and (b) to ensure the integrity of the personal Information."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "We limit access to your personal Information to those who have a genuine business need to do so. We also endeavor that the any recipient of such Information agree to process such Information based on our instructions and in compliance with this Privacy Policy and any other appropriate confidentiality and security measures."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "We also have procedures in place to deal with any suspected data security breach. We will notify you and any applicable regulator of a suspected data security breach where we are legally required to do so."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "However, as effective as our security measures are, no security system is impenetrable. We cannot guarantee the security of our database, nor can we guarantee that Information you supply will not be intercepted while being transmitted to us over the Internet, any transmission is at your own risk. And, of course, any Information you include in a posting to the discussion areas is available to anyone with Internet access."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "The Website may, from time to time, contain links to and from the websites of our partner networks, advertisers and affiliates. If you follow a link to any of these websites, please note that these websites have their own privacy policies and terms of use and that we do not accept any responsibility or liability for these policies and terms of use. Please check these policies before you submit any personal information to these websites."),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "Remember that even after you cancel your account, copies of some Information from your account may remain viewable in some circumstances where, for example, you have shared information with social media or other services and such Information is outside the Company’s control. Further, if you have reason to believe that your interaction with us is no longer secure (for example, if you feel that the security of your account has been compromised), please immediately notify us."),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    SecondLabel(
                        label:
                            "6. TRANSFER OF PERSONAL INFORMATION TO OTHER COUNTRIES"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Some of the uses and disclosures mentioned in this Privacy Policy may involve the transfer and processing of your personal Information to and in various countries around the world that may have different levels of privacy protection than your country. By submitting your personal Information, you consent to such transfers and processing, including to and in the United States. In certain circumstances, courts, law enforcement agencies, regulatory agencies or security authorities in those other countries will be entitled to access your information."),
                    SizedBox(height: 26),
                    SecondLabel(label: "7. RIGHTS AVAILABLE TO YOU"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "You have a number of important rights free of charge. In summary, those include rights to:"),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText(
                              label:
                                  "a) Access and updating your Information "),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "When you use the Services or the Website, we make good faith efforts to provide you, as and when requested by you, with access to your Information. Further, if there is any change in your Information, you may update it by accessing the relevant page of the Website, or by contacting us. If you have any questions about how we use the Information collected which relates to you, please contact us. We will endeavour to update your Information within 14 working days of any new or updated Information being provided to us, in order to ensure that the Information we hold about you is as accurate and up to date as possible;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "b) Require us to correct any mistakes in your Information "),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "In such case we shall ensure that any Information or data found to be inaccurate or deficient shall be corrected or amended as feasible, subject to any requirement for such Information to be retained by law or for legitimate business purposes;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "c) Require the erasure of your Information in certain situations;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "d) Require us to restrict processing or object at any time to processing of personal Information in certain situations;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "e) Receive the personal Information concerning you which you have provided to us, in a structured, commonly used and machine-readable format and have the right to transmit that data to a third party in certain situations;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "f) Object to decisions being taken by automated means which produce legal effects concerning you or similarly significantly affect you;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "g) Object in certain other situations to our continued processing of your personal Information;"),
                          SizedBox(height: 20),
                          LabelText(
                              label:
                                  "h) Otherwise restrict our processing of your personal Information in certain circumstances."),
                          SizedBox(height: 20),
                          TermsText(
                              txt:
                                  "We ask individual users to identify themselves and the Information requested to be accessed, corrected or removed before processing such requests or inform other limitations you would like to put on our use of your personal Information. If you would like to exercise any of those rights, please:"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    SecondLabel(
                        label:
                            "email, call or write to us and provide us enough information to identify you [(e.g. account number, user name, registration details)],"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "let us know the Information to which your request relates."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "We may need to verify your identity before fulfilling your request. We will try to comply with your request as soon as reasonably practicable. Please note that we often need to retain certain data for record keeping purposes and/or to complete any transactions that you began prior to requesting a change or deletion. Further, because of the way we maintain certain services, after you delete your Information, residual copies may take a period of time before they are deleted from our active servers and may remain in our backup systems. In addition, there may be certain data that we may not allow you to review for legal, security or other reasons."),
                    SizedBox(height: 26),
                    SecondLabel(label: "8.RETENTION"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "We will retain Information for the period necessary to fulfil the purposes outlined in this Privacy Policy unless a longer retention period is required or permitted by law."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The criteria used to determine our retention periods include:"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The length of time we have an ongoing relationship with you and provide the Services to you (for example, for as long as you keep using the Services)"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Whether there is a legal obligation to which we are subject (for example, certain laws require us to keep records of your transactions for a certain period of time before we can delete them)"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Whether retention is advisable considering our legal position (such as, for statutes of limitations, litigation or regulatory investigations)"),
                    SizedBox(height: 26),
                    SecondLabel(label: "9. CHILDREN USING OUR SERVICES"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Except where otherwise indicated, we do not knowingly collect or store any personal Information from children under the age of 13. If you are aged 13 or under, we request that you do not provide us with Information relating to you or to others. Please seek the guidance of your parent or guardian before using our Services."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "If you are the parent or guardian of a child who is aged under 16 and you become aware that your child has provided us with information without your consent, please contact us as given below. We will delete such information from our records within a reasonable time."),
                    SizedBox(height: 14),
                    TermsText(txt: "Older Children"),
                    TermsText(
                        txt:
                            "Depending on the service, we may also seek to obtain the consent of your parent or guardian if you are under the age of 18."),
                    SizedBox(height: 26),
                    SecondLabel(
                        label: "10. MODIFICATIONS TO THIS PRIVACY POLICY"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The Company may alter this Privacy Policy to incorporate necessary changes in technology, applicable law or any other variant from time to time by posting revisions on this web page. Such changes will be effective upon posting. Your use of the app or Services after such notice will be deemed acceptance of such changes. In any case, you are advised to review this Privacy Policy periodically to ensure that you are aware of the latest version."),
                    SizedBox(height: 26),
                    SecondLabel(label: "11. QUESTIONS / GRIEVANCE REDRESSAL"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "All questions, comments and requests regarding this Privacy Policy should be addressed to [ADD DETAILS OF YORU LEGAL DEPARTMENT AND LEGAL HEAD]"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Redressal Mechanism: Any complaints. or concerns with regards to the processing of information provided by you or breach of these terms shall be immediately informed to the designated Grievance Officer as mentioned below via in writing by email "),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "We request you to please provide the following information in your complaint:"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "a) Your address, telephone number and e-mail address;"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "b) A statement, under penalty of perjury, that the information in the notice is accurate;"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The company shall not be responsible for any communication, if addressed, to any non-designated person in this regard."),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 30,
                ),
                child: Text(
                  "Cookies Policy",
                  style: GoogleFonts.poppins(
                    color: dimGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TermsText(
                        txt:
                            "Like most websites, the Company’s website (hereinafter “Website”) uses cookies to distinguish you from other users."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "This Policy explains how cookies are used on the Website and, below, how you can control the cookies that may be used on this Website (not all of them are used on every site)."),
                    SizedBox(height: 26),
                    SecondLabel(label: "1. What is a Cookie?"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "A cookie is a piece of software code that an internet website sends to your browser when you access information at that site. A cookie is stored as a simple text file on your computer or mobile device by a website’s server and only that server will be able to retrieve or read the contents of that cookie. Cookies let you navigate between pages efficiently as they store your preferences."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Generally speaking, cookies do not contain personal information from which you can be identified, unless you have furnished such information to the Website. This Website uses cookies to track usage and help improve features and Services. This information helps us monitor traffic on our Website so that we can manage the Website’s capacity and efficiency. It also helps us to understand which parts of the Website are most popular, and generally to assess user behaviour and characteristics in order to measure interest in and use of the various areas of the Website."),
                    SizedBox(height: 26),
                    SecondLabel(label: "2. About this Cookie Policy"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "This Cookie Policy forms part of and is incorporated into our Website Terms and Conditions. By accessing the Website, you agree that this Cookie Policy will apply whenever you access the Website on any device. Any changes to this Policy will be posted here. We reserve the right to vary this Cookie Policy from time to time and such changes shall become effective as soon as they are posted. Your continued use of the Website constitutes your agreement to all such changes."),
                    SizedBox(height: 26),
                    SecondLabel(label: "3. How we use Cookies"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "We collect information on our users through registration and the use of the Website, through cookies, where you choose to disclose data in postings, and when you enter sales promotion and competitions."),
                    SizedBox(height: 10),
                    TermsText(txt: "We use cookies for a number of reasons:"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "(i) To gather statistics: We track how many ‘unique users’ we have and how often they visit our Website. We track how often different pages of our Website are visited and which countries our visitors come from. Accurate statistics enable us to sell advertising and continue to provide a top quality service to you. The information collected by cookies does not personally identify you; it includes general information about your computer settings, your connection to the Internet e.g. operating system and platform, IP address, your browsing patterns and timings of browsing on the Website and your location."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "(ii) Flash cookies may be used to store user preferences for media player functionality and without them some video content may not render correctly."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "By using the sites you are agreeing to the use of cookies as described."),
                    SizedBox(height: 26),
                    SecondLabel(label: "4. Types of cookie that may be used"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "The following types of cookie are used on this site. We don’t list every single cookie used by name – but for each type of cookie we tell you how you can control its use."),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThirdLabel(label: "A. First Party Cookies"),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "These are our own cookies, controlled by us and used to provide information about usage of our site."),
                          SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(label: "(i) Personalisation cookies"),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "These cookies are used to recognise repeat visitors to the Website and in conjunction with other Information we hold to attempt to record specific browsing information (that is, about the way you arrive at the Website, pages you view, options you select, information you enter and the path you take through the Website). These are used to recommend content we think you’ll be interested in based on what you’ve looked at before."),
                                SizedBox(height: 16),
                                LabelText(label: "(ii) Analytics cookies"),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "These monitor how visitors move around the Website and how they reached it. This is used so that we can see total (not individual) figures on which types of content users enjoy most, for instance."),
                                SizedBox(height: 16),
                                LabelText(
                                    label: "(iii) Site management cookies"),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "These are used to maintain your identity or session on the Website. For instance, where our Websites run on more than one server, we use a cookie to ensure that you are sent information by one specific server (otherwise you may log in or out unexpectedly). We may use similar cookies when you vote in opinion polls to ensure that you can only vote once, and to ensure that you can use our commenting functionality when not logged in (to ensure you don’t see comments you’ve reported as abusive, for instance, or don’t vote comments up/down more than once)."),
                              ],
                            ),
                          ),
                          SizedBox(height: 26),
                          ThirdLabel(label: "B. Third Party Cookies"),
                          SizedBox(height: 10),
                          TermsText(
                              txt:
                                  "These are cookies found in other companies’ internet tools which we are using to enhance our Website, for example Facebook, Twitter, have their own cookies, pixel tags, etc. which are controlled by them. We have no control on such cookies. The companies that generate these cookies have their own privacy policies and the Company has no access to read or write these cookies, other than allowing them to be served, we have no role to play in these cookies at all"),
                          SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelText(
                                    label: "(i) Third-party service cookies"),
                                SizedBox(height: 10),
                                TermsText(
                                    txt:
                                        "Social sharing, video and other services we offer are run by other companies. These companies may drop cookies on your computer when you use them on our Website or if you are already logged in to them."),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    SecondLabel(label: "5. Turning off Cookies"),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "Most browsers allow you to turn off cookies (including essential cookies). If you want to know how to do this please look up the help menu on your browser. However, switching off cookies may restrict your use of the Website and/or affect the way in which the Website operates. Also, if you do this you may not be able to use all Services on our Website and you might see more pop-ups and other intrusive advertising, as we won’t be able to limit what you see using cookies. You will, however, still be able to view editorial content."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "All modern browsers allow you to change your cookie settings. These settings will typically be found in the ‘options’ or ‘preferences’ menu of your browser. In order to understand these settings, the following links may be helpful, otherwise you should use the ‘Help’ option in your browser for more details."),
                    SizedBox(height: 10),
                    TermsText(
                        txt:
                            "[YOUR ACCESS AND USE OF SERVICES SHALL MEAN THAT YOU HAVE READ, UNDERSTAND AND AGREE TO BE BOUND BY THIS PRIVACY POLICY. BY ACCESSING OR USING SERVICES YOU ALSO REPRESENT THAT YOU HAVE THE LEGAL AUTHORITY AS PER APPLICABLE LAW TO ACCEPT THE TERMS ON BEHALF OF YOURSELF AND/OR ANY OTHER PERSON YOU REPRESENT IN CONNECTION WITH YOUR USE OF THE SERVICES.]"),
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
