import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// --- THEME DEFINITIONS ---
// For simplicity, these are included in main.dart.
// In a larger app, this would be in its own file (e.g., core/theme/app_theme.dart).
class AppTheme {
  // Colors
  static const Color primaryTextColor = Color(0xFF0B0D11);
  static const Color secondaryTextColor = Color(0xFF313131);
  static const Color tertiaryTextColor = Color(0xFF545454);
  static const Color greyTextColor = Color(0xFF9C9C9C);
  static const Color blackColor = Color(0xFF000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightGreyBg = Color(0xFFF4F4F4);
  static const Color borderColor = Color(0xFFE1E1E1);
  static const Color blueAccent = Color(0xFF3B6ECC);
  static const Color greenAccent = Color(0xFFEDFFEE);

  // Text Styles
  static TextTheme getTextTheme() {
    return TextTheme(
      headlineSmall: GoogleFonts.raleway(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF424242)),
      titleLarge: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: primaryTextColor),
      bodyMedium: GoogleFonts.raleway(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          height: 1.5),
      bodySmall: GoogleFonts.raleway(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: primaryTextColor,
          height: 1.5),
      labelMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: secondaryTextColor),
    );
  }
}

// --- APP INITIALIZATION ---
void main() {
  runApp(const MyApp());
}

// --- ROUTING LOGIC ---
final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/old-login',
      builder: (context, state) => const OldUserLoginScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OTPScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

// --- MAIN APP WIDGET ---
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ELSSA Services',
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.whiteColor,
        textTheme: AppTheme.getTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppTheme.whiteColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppTheme.blackColor),
          titleTextStyle: TextStyle(
              color: AppTheme.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      routerConfig: _router,
    );
  }
}

// --- SCREEN DEFINITIONS ---

// SPLASH SCREEN
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/login');
    });
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your actual logo asset
            const Icon(Icons.flash_on, size: 100, color: AppTheme.blueAccent),
            const SizedBox(height: 20),
            Text('ELSSA',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Powered by Oyelabs with ❤️',
                style: TextStyle(color: AppTheme.greyTextColor)),
          ],
        ),
      ),
    );
  }
}

// LOGIN SCREEN
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Replace with your illustration
              const Icon(Icons.home_repair_service,
                  size: 150, color: AppTheme.blueAccent),
              const SizedBox(height: 20),
              const Text('Your Home services Expert',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text('Continue with Phone Number',
                  style: TextStyle(color: AppTheme.greyTextColor, fontSize: 16)),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Mobile Number',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text('🇺🇸 +1', style: TextStyle(fontSize: 16)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/otp'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.blackColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('SIGN UP',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              TextButton(
                  onPressed: () => context.go('/old-login'),
                  child: const Text('VIEW OTHER OPTION',
                      style: TextStyle(color: AppTheme.blueAccent))),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () => context.go('/old-login'),
                      child: const Text('LOG IN')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// OLD USER LOGIN SCREEN
class OldUserLoginScreen extends StatelessWidget {
  const OldUserLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Welcome Back!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.facebook, color: Colors.white),
              label: const Text('CONTINUE WITH FACEBOOK',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3b5998),
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              // Replace with Google icon asset
              icon: const Icon(Icons.g_mobiledata, color: AppTheme.blackColor),
              label: const Text('CONTINUE WITH GOOGLE',
                  style: TextStyle(color: AppTheme.blackColor)),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 30),
            const Text('OR CONTINUE WITH PHONE NUMBER',
                style: TextStyle(color: AppTheme.greyTextColor)),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Mobile Number',
                prefixIcon: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text('🇺🇸 +1', style: TextStyle(fontSize: 16))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/otp'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.blackColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text('LOG IN',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Forgot Password?')),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () => context.go('/login'),
                    child: const Text('SIGN UP')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// OTP SCREEN
class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Replace with your illustration
            const Icon(Icons.phonelink_lock,
                size: 120, color: AppTheme.blueAccent),
            const SizedBox(height: 20),
            const Text('OTP Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Enter the OTP sent to +1 8878878875',
                style: TextStyle(color: Colors.grey.shade700)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  4,
                  (index) => SizedBox(
                      width: 50,
                      child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                          decoration:
                              const InputDecoration(border: UnderlineInputBorder())))),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("OTP not received? "),
                TextButton(onPressed: () {}, child: const Text('RESEND OTP'))
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/home'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.blackColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text('VERIFY & PROCEED',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HOME SCREEN (WITH BOTTOM NAVIGATION)
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text('Rewards')),
    const Center(child: Text('My Orders')),
    const Center(child: Text('Bookings')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.blackColor,
        unselectedItemColor: AppTheme.greyTextColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'My Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// HOME SCREEN CONTENT (THE SCROLLABLE PART)
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          backgroundColor: AppTheme.whiteColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppTheme.greyTextColor)),
              const Text('Inner Circle, Connaught Place',
                  style: TextStyle(
                      color: AppTheme.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.search, color: AppTheme.blackColor),
                onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              _buildBannerWithServices(context),
              _buildServiceGrid(),
              _buildSectionDivider(),
              _buildServiceRows("Popular Services"),
              _buildSectionDivider(),
              _buildServiceRows("Cleaning Services"),
              _buildSectionDivider(),
              _buildInfoBanners(),
              _buildWhyChooseUs(context),
              const SafetyMeasures(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBannerWithServices(BuildContext context) {
    return Container(
      height: 210,
      margin: const EdgeInsets.only(bottom: 12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/banner.png', // <-- ADD YOUR BANNER IMAGE TO ASSETS
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: AppTheme.lightGreyBg),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color.fromRGBO(0, 0, 0, 0.84),
                    Colors.transparent
                  ],
                  stops: [0.0, 0.4, 0.65],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 20,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBannerService("Renovation", Icons.construction),
                _buildBannerService("Handyman", Icons.handyman),
                _buildBannerService("Home shifting", Icons.local_shipping),
                _buildBannerService("Gardening", Icons.grass),
                _buildBannerService("Declutter", Icons.cleaning_services),
                _buildBannerService("Painting", Icons.format_paint),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBannerService(String name, IconData icon) {
    return Row(
      children: [
        Container(
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF121212), Color(0xFF15212D)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Icon(icon, color: Colors.white, size: 14),
        ),
        const SizedBox(width: 14),
        Text(
          name,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _ServiceGridItem(icon: Icons.construction, label: "Renovation"),
              _ServiceGridItem(icon: Icons.handyman, label: "Handyman"),
              _ServiceGridItem(
                  icon: Icons.local_shipping, label: "Home shifting"),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _ServiceGridItem(icon: Icons.grass, label: "Gardening"),
              _ServiceGridItem(
                  icon: Icons.cleaning_services, label: "Declutter"),
              _ServiceGridItem(icon: Icons.format_paint, label: "Painting"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceRows(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(title, style: AppTheme.getTextTheme().headlineSmall),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              children: [
                _ServiceRowItem(
                    imagePath: 'assets/kitchen.png', // <-- ADD ASSET
                    label: 'Kitchen Cleaning'),
                _ServiceRowItem(
                    imagePath: 'assets/sofa.png', // <-- ADD ASSET
                    label: 'Sofa Cleaning'),
                _ServiceRowItem(
                    imagePath: 'assets/house.png', // <-- ADD ASSET
                    label: 'Full House Cleaning'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoBanners() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _InfoBannerItem(
              icon: Icons.schedule, text: "On Demand/\nScheduled"),
          _InfoBannerItem(
              icon: Icons.verified_user, text: "Verified\nPartners"),
          _InfoBannerItem(
              icon: Icons.thumb_up, text: "Satisfaction\nGuarantee"),
          _InfoBannerItem(icon: Icons.sell, text: "Upfront\nPricing"),
        ],
      ),
    );
  }

  Widget _buildWhyChooseUs(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppTheme.blackColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.security,
                    color: AppTheme.whiteColor, size: 16),
              ),
              const SizedBox(width: 8),
              Text("Why Choose Us",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 16),
          _FeatureCard(
            icon: Icons.workspace_premium,
            title: "Quality Assurance",
            subtitle: "Your satisfaction is guaranteed",
            iconBgColor: const Color(0xFFFFBE35),
          ),
          const SizedBox(height: 12),
          _FeatureCard(
            icon: Icons.receipt_long,
            title: "Fixed Prices",
            subtitle:
                "No hidden costs, all the prices are known and fixed before booking",
            iconBgColor: const Color(0xFFA5C3DC),
          ),
          const SizedBox(height: 12),
          _FeatureCard(
            icon: Icons.thumb_up_alt,
            title: "Hassle free",
            subtitle: "Convenient, time saving and secure",
            iconBgColor: const Color(0xFFF9A671),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionDivider() {
    return Container(
      height: 12,
      color: AppTheme.lightGreyBg,
    );
  }
}

// --- WIDGETS FOR HOME SCREEN ---

class _ServiceGridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ServiceGridItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.lightGreyBg),
        color: AppTheme.whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: AppTheme.blueAccent),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style: AppTheme.getTextTheme().labelMedium),
        ],
      ),
    );
  }
}

class _ServiceRowItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const _ServiceRowItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 84,
              width: 134,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                  height: 84,
                  width: 134,
                  color: AppTheme.lightGreyBg,
                  child: const Icon(Icons.image_not_supported)),
            ),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: AppTheme.getTextTheme()
                  .labelMedium
                  ?.copyWith(color: AppTheme.tertiaryTextColor)),
        ],
      ),
    );
  }
}

class _InfoBannerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoBannerItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.greenAccent,
          ),
          child: Icon(icon, color: AppTheme.blueAccent, size: 24),
        ),
        const SizedBox(height: 8),
        Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300)),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBgColor;

  const _FeatureCard(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.iconBgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconBgColor, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.getTextTheme().titleLarge),
                Text(subtitle, style: AppTheme.getTextTheme().bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SafetyMeasures extends StatelessWidget {
  const SafetyMeasures({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Container(
            color: Colors.black87,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Center(
                child: Text('Best-in Class Safety Measures',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSafetyItem(Icons.masks,
                    'Usage of masks, gloves & Sanitisers',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                const SizedBox(height: 16),
                _buildSafetyItem(Icons.social_distance,
                    'Low-contact Service Experience',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, size: 40, color: Colors.black54),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(subtitle, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }
}
