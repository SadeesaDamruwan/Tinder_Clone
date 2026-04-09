import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  // --- UI Colors ---
  final Color mainMagenta = const Color(0xFFE94057);
  final Color secondaryTextColor = const Color(0xFF757575);

  // --- State Variable to track the selected country ---
  Map<String, String> selectedCountry = {"name": "United States", "code": "US", "dialCode": "+1"};

  // --- Massive List of Global Country Codes ---
  final List<Map<String, String>> countries = [
    {"name": "Afghanistan", "code": "AF", "dialCode": "+93"},
    {"name": "Albania", "code": "AL", "dialCode": "+355"},
    {"name": "Algeria", "code": "DZ", "dialCode": "+213"},
    {"name": "Andorra", "code": "AD", "dialCode": "+376"},
    {"name": "Angola", "code": "AO", "dialCode": "+244"},
    {"name": "Argentina", "code": "AR", "dialCode": "+54"},
    {"name": "Armenia", "code": "AM", "dialCode": "+374"},
    {"name": "Australia", "code": "AU", "dialCode": "+61"},
    {"name": "Austria", "code": "AT", "dialCode": "+43"},
    {"name": "Azerbaijan", "code": "AZ", "dialCode": "+994"},
    {"name": "Bahamas", "code": "BS", "dialCode": "+1"},
    {"name": "Bahrain", "code": "BH", "dialCode": "+973"},
    {"name": "Bangladesh", "code": "BD", "dialCode": "+880"},
    {"name": "Belarus", "code": "BY", "dialCode": "+375"},
    {"name": "Belgium", "code": "BE", "dialCode": "+32"},
    {"name": "Bolivia", "code": "BO", "dialCode": "+591"},
    {"name": "Bosnia and Herzegovina", "code": "BA", "dialCode": "+387"},
    {"name": "Brazil", "code": "BR", "dialCode": "+55"},
    {"name": "Bulgaria", "code": "BG", "dialCode": "+359"},
    {"name": "Cambodia", "code": "KH", "dialCode": "+855"},
    {"name": "Cameroon", "code": "CM", "dialCode": "+237"},
    {"name": "Canada", "code": "CA", "dialCode": "+1"},
    {"name": "Chile", "code": "CL", "dialCode": "+56"},
    {"name": "China", "code": "CN", "dialCode": "+86"},
    {"name": "Colombia", "code": "CO", "dialCode": "+57"},
    {"name": "Costa Rica", "code": "CR", "dialCode": "+506"},
    {"name": "Croatia", "code": "HR", "dialCode": "+385"},
    {"name": "Cuba", "code": "CU", "dialCode": "+53"},
    {"name": "Cyprus", "code": "CY", "dialCode": "+357"},
    {"name": "Czech Republic", "code": "CZ", "dialCode": "+420"},
    {"name": "Denmark", "code": "DK", "dialCode": "+45"},
    {"name": "Dominican Republic", "code": "DO", "dialCode": "+1"},
    {"name": "Ecuador", "code": "EC", "dialCode": "+593"},
    {"name": "Egypt", "code": "EG", "dialCode": "+20"},
    {"name": "El Salvador", "code": "SV", "dialCode": "+503"},
    {"name": "Estonia", "code": "EE", "dialCode": "+372"},
    {"name": "Ethiopia", "code": "ET", "dialCode": "+251"},
    {"name": "Fiji", "code": "FJ", "dialCode": "+679"},
    {"name": "Finland", "code": "FI", "dialCode": "+358"},
    {"name": "France", "code": "FR", "dialCode": "+33"},
    {"name": "Georgia", "code": "GE", "dialCode": "+995"},
    {"name": "Germany", "code": "DE", "dialCode": "+49"},
    {"name": "Ghana", "code": "GH", "dialCode": "+233"},
    {"name": "Greece", "code": "GR", "dialCode": "+30"},
    {"name": "Guatemala", "code": "GT", "dialCode": "+502"},
    {"name": "Honduras", "code": "HN", "dialCode": "+504"},
    {"name": "Hong Kong", "code": "HK", "dialCode": "+852"},
    {"name": "Hungary", "code": "HU", "dialCode": "+36"},
    {"name": "Iceland", "code": "IS", "dialCode": "+354"},
    {"name": "India", "code": "IN", "dialCode": "+91"},
    {"name": "Indonesia", "code": "ID", "dialCode": "+62"},
    {"name": "Iran", "code": "IR", "dialCode": "+98"},
    {"name": "Iraq", "code": "IQ", "dialCode": "+964"},
    {"name": "Ireland", "code": "IE", "dialCode": "+353"},
    {"name": "Israel", "code": "IL", "dialCode": "+972"},
    {"name": "Italy", "code": "IT", "dialCode": "+39"},
    {"name": "Jamaica", "code": "JM", "dialCode": "+1"},
    {"name": "Japan", "code": "JP", "dialCode": "+81"},
    {"name": "Jordan", "code": "JO", "dialCode": "+962"},
    {"name": "Kazakhstan", "code": "KZ", "dialCode": "+7"},
    {"name": "Kenya", "code": "KE", "dialCode": "+254"},
    {"name": "Kuwait", "code": "KW", "dialCode": "+965"},
    {"name": "Lebanon", "code": "LB", "dialCode": "+961"},
    {"name": "Lithuania", "code": "LT", "dialCode": "+370"},
    {"name": "Luxembourg", "code": "LU", "dialCode": "+352"},
    {"name": "Malaysia", "code": "MY", "dialCode": "+60"},
    {"name": "Malta", "code": "MT", "dialCode": "+356"},
    {"name": "Mexico", "code": "MX", "dialCode": "+52"},
    {"name": "Monaco", "code": "MC", "dialCode": "+377"},
    {"name": "Morocco", "code": "MA", "dialCode": "+212"},
    {"name": "Nepal", "code": "NP", "dialCode": "+977"},
    {"name": "Netherlands", "code": "NL", "dialCode": "+31"},
    {"name": "New Zealand", "code": "NZ", "dialCode": "+64"},
    {"name": "Nigeria", "code": "NG", "dialCode": "+234"},
    {"name": "Norway", "code": "NO", "dialCode": "+47"},
    {"name": "Oman", "code": "OM", "dialCode": "+968"},
    {"name": "Pakistan", "code": "PK", "dialCode": "+92"},
    {"name": "Panama", "code": "PA", "dialCode": "+507"},
    {"name": "Paraguay", "code": "PY", "dialCode": "+595"},
    {"name": "Peru", "code": "PE", "dialCode": "+51"},
    {"name": "Philippines", "code": "PH", "dialCode": "+63"},
    {"name": "Poland", "code": "PL", "dialCode": "+48"},
    {"name": "Portugal", "code": "PT", "dialCode": "+351"},
    {"name": "Qatar", "code": "QA", "dialCode": "+974"},
    {"name": "Romania", "code": "RO", "dialCode": "+40"},
    {"name": "Russia", "code": "RU", "dialCode": "+7"},
    {"name": "Saudi Arabia", "code": "SA", "dialCode": "+966"},
    {"name": "Senegal", "code": "SN", "dialCode": "+221"},
    {"name": "Serbia", "code": "RS", "dialCode": "+381"},
    {"name": "Singapore", "code": "SG", "dialCode": "+65"},
    {"name": "Slovakia", "code": "SK", "dialCode": "+421"},
    {"name": "Slovenia", "code": "SI", "dialCode": "+386"},
    {"name": "South Africa", "code": "ZA", "dialCode": "+27"},
    {"name": "South Korea", "code": "KR", "dialCode": "+82"},
    {"name": "Spain", "code": "ES", "dialCode": "+34"},
    {"name": "Sri Lanka", "code": "LK", "dialCode": "+94"},
    {"name": "Sweden", "code": "SE", "dialCode": "+46"},
    {"name": "Switzerland", "code": "CH", "dialCode": "+41"},
    {"name": "Taiwan", "code": "TW", "dialCode": "+886"},
    {"name": "Tanzania", "code": "TZ", "dialCode": "+255"},
    {"name": "Thailand", "code": "TH", "dialCode": "+66"},
    {"name": "Tunisia", "code": "TN", "dialCode": "+216"},
    {"name": "Turkey", "code": "TR", "dialCode": "+90"},
    {"name": "Uganda", "code": "UG", "dialCode": "+256"},
    {"name": "Ukraine", "code": "UA", "dialCode": "+380"},
    {"name": "United Arab Emirates", "code": "AE", "dialCode": "+971"},
    {"name": "United Kingdom", "code": "GB", "dialCode": "+44"},
    {"name": "United States", "code": "US", "dialCode": "+1"},
    {"name": "Uruguay", "code": "UY", "dialCode": "+598"},
    {"name": "Uzbekistan", "code": "UZ", "dialCode": "+998"},
    {"name": "Venezuela", "code": "VE", "dialCode": "+58"},
    {"name": "Vietnam", "code": "VN", "dialCode": "+84"},
    {"name": "Zambia", "code": "ZM", "dialCode": "+260"},
    {"name": "Zimbabwe", "code": "ZW", "dialCode": "+263"},
  ];

  // --- Function to show the Bottom Sheet ---
  void _showCountryPicker() {
    // Local state for the search bar inside the bottom sheet
    List<Map<String, String>> filteredCountries = List.from(countries);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows sheet to take up more screen space
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder( // StatefulBuilder allows updating the modal UI
            builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7, // 70% of screen height
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Little drag handle at the top
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Select Country', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),

                    // --- Search Bar ---
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search countries...',
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                        fillColor: Colors.grey[100],
                        filled: true,
                      ),
                      onChanged: (value) {
                        setModalState(() {
                          filteredCountries = countries
                              .where((country) => country['name']!.toLowerCase().contains(value.toLowerCase()) ||
                              country['dialCode']!.contains(value))
                              .toList();
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- Country List ---
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredCountries.length,
                        itemBuilder: (context, index) {
                          final country = filteredCountries[index];
                          return ListTile(
                            title: Text(country['name']!),
                            trailing: Text(country['dialCode']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            leading: Text(country['code']!, style: const TextStyle(fontSize: 18)),
                            onTap: () {
                              // Update the main screen state
                              setState(() {
                                selectedCountry = country;
                              });
                              // Close the modal
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Kinetic Gallery', style: TextStyle(color: mainMagenta, fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: BackButton(color: mainMagenta),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('My number is', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 12),
              Text('We\'ll send a text with a verification code. Message and data rates may apply.', style: TextStyle(fontSize: 15, color: secondaryTextColor, height: 1.4)),
              const SizedBox(height: 35),

              // --- The Interactive Country Code & Phone Input ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Country Code Picker Button
                  Container(
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: 1.5))),
                    child: TextButton(
                      style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12)),
                      onPressed: _showCountryPicker, // Triggers the modal sheet
                      child: Row(
                        children: [
                          // Display the currently selected country dynamically
                          Text('${selectedCountry["code"]} ${selectedCountry["dialCode"]}',
                              style: TextStyle(color: mainMagenta, fontSize: 18, fontWeight: FontWeight.w600)
                          ),
                          Icon(Icons.arrow_drop_down, color: mainMagenta),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  // Phone Number Input
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: '000 000 0000',
                        hintStyle: const TextStyle(color: Colors.black12),
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 1.5)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: mainMagenta, width: 1.5)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFFFDE8F3).withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Icon(Icons.verified_user_rounded, color: mainMagenta, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Safe & Secure', style: TextStyle(fontWeight: FontWeight.bold, color: mainMagenta)),
                          const SizedBox(height: 4),
                          Text('Verification helps us keep the gallery authentic and prevents bot activity.', style: TextStyle(color: mainMagenta, fontSize: 13)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainMagenta,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/discover');
                  },
                  label: const Text('Continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
              const SizedBox(height: 15),

              Center(child: Text('VERIFY IDENTITY TO UNLOCK FEATURES', style: TextStyle(color: mainMagenta, fontSize: 11, fontWeight: FontWeight.w700))),
              const SizedBox(height: 20),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Privacy Policy', style: TextStyle(fontSize: 12, color: secondaryTextColor, decoration: TextDecoration.underline)),
                      const SizedBox(width: 15),
                      Text('Terms of Service', style: TextStyle(fontSize: 12, color: secondaryTextColor, decoration: TextDecoration.underline)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('© 2024 The Kinetic Gallery. All rights reserved.', style: TextStyle(color: Colors.grey, fontSize: 11)),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}