import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 

// Data Models
class ServiceProvider {
  String name;
  String profession;
  double rating;
  int completedOrders;
  int uniqueClients;
  double walletBalance;
  bool isAvailable;
  String? phoneNumber;
  String? profileImage;

  ServiceProvider({
    required this.name,
    required this.profession,
    required this.rating,
    required this.completedOrders,
    required this.uniqueClients,
    required this.walletBalance,
    this.isAvailable = true,
    this.phoneNumber,
    this.profileImage,
  });

  ServiceProvider copyWith({
    String? name,
    String? profession,
    double? rating,
    int? completedOrders,
    int? uniqueClients,
    double? walletBalance,
    bool? isAvailable,
    String? phoneNumber,
    String? profileImage,
  }) {
    return ServiceProvider(
      name: name ?? this.name,
      profession: profession ?? this.profession,
      rating: rating ?? this.rating,
      completedOrders: completedOrders ?? this.completedOrders,
      uniqueClients: uniqueClients ?? this.uniqueClients,
      walletBalance: walletBalance ?? this.walletBalance,
      isAvailable: isAvailable ?? this.isAvailable,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}

class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final String type; // 'earning' or 'withdrawal'
  final String? orderId;

  Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
    this.orderId,
  });
}

class ServiceRequest {
  final String id;
  final String clientName;
  final String serviceType;
  final String description;
  final String location;
  final double offeredPrice;
  final DateTime requestTime;
  final String status; // 'pending', 'accepted', 'rejected'
  final String? clientPhone;

  ServiceRequest({
    required this.id,
    required this.clientName,
    required this.serviceType,
    required this.description,
    required this.location,
    required this.offeredPrice,
    required this.requestTime,
    required this.status,
    this.clientPhone,
  });

  ServiceRequest copyWith({
    String? status,
  }) {
    return ServiceRequest(
      id: id,
      clientName: clientName,
      serviceType: serviceType,
      description: description,
      location: location,
      offeredPrice: offeredPrice,
      requestTime: requestTime,
      status: status ?? this.status,
      clientPhone: clientPhone,
    );
  }
}

class ActiveOrder {
  final String id;
  final String clientName;
  final String serviceType;
  final String description;
  final String location;
  final double price;
  final DateTime startTime;
  final String status; // 'in_progress', 'completed', 'cancelled'
  final String? clientPhone;

  ActiveOrder({
    required this.id,
    required this.clientName,
    required this.serviceType,
    required this.description,
    required this.location,
    required this.price,
    required this.startTime,
    required this.status,
    this.clientPhone,
  });

  ActiveOrder copyWith({
    String? status,
  }) {
    return ActiveOrder(
      id: id,
      clientName: clientName,
      serviceType: serviceType,
      description: description,
      location: location,
      price: price,
      startTime: startTime,
      status: status ?? this.status,
      clientPhone: clientPhone,
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Dynamic provider data
  late ServiceProvider provider;
  List<Transaction> transactions = [];
  List<ServiceRequest> serviceRequests = [];
  List<ActiveOrder> activeOrders = [];
  int unreadRequestsCount = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _simulateRealTimeUpdates();
  }

  void _initializeData() {
    provider = ServiceProvider(
      name: "Hatem Nasser",
      profession: "Plumber",
      rating: 4.8,
      completedOrders: 127,
      uniqueClients: 98,
      walletBalance: 2450.50,
      phoneNumber: "01271964322",
    );

    transactions = [
      Transaction(
        id: "1",
        description: "Kitchen pipe repair",
        amount: 150.0,
        date: DateTime.now().subtract(Duration(hours: 2)),
        type: 'earning',
        orderId: "ORD001",
      ),
      Transaction(
        id: "2",
        description: "Bank withdrawal",
        amount: -500.0,
        date: DateTime.now().subtract(Duration(days: 3)),
        type: 'withdrawal',
      ),
      Transaction(
        id: "3",
        description: "Bathroom shower repair",
        amount: 200.0,
        date: DateTime.now().subtract(Duration(days: 5)),
        type: 'earning',
        orderId: "ORD002",
      ),
    ];

    serviceRequests = [
      ServiceRequest(
        id: "REQ001",
        clientName: "Sarah Ahmed",
        serviceType: "Plumbing",
        description: "Toilet is clogged and overflowing",
        location: "New Cairo, Building 15, Apt 302",
        offeredPrice: 120.0,
        requestTime: DateTime.now().subtract(Duration(minutes: 15)),
        status: "pending",
        clientPhone: "+20111111111",
      ),
      ServiceRequest(
        id: "REQ002",
        clientName: "Mohamed Ali",
        serviceType: "Plumbing",
        description: "Water heater installation",
        location: "Nasr City, Street 10",
        offeredPrice: 300.0,
        requestTime: DateTime.now().subtract(Duration(minutes: 30)),
        status: "pending",
        clientPhone: "+20222222222",
      ),
      ServiceRequest(
        id: "REQ003",
        clientName: "Fatima Hassan",
        serviceType: "Plumbing",
        description: "Kitchen sink leak repair",
        location: "Heliopolis, Main Street",
        offeredPrice: 80.0,
        requestTime: DateTime.now().subtract(Duration(hours: 1)),
        status: "pending",
        clientPhone: "+20333333333",
      ),
    ];

    activeOrders = [
      ActiveOrder(
        id: "ORD005",
        clientName: "Omar Khaled",
        serviceType: "Plumbing",
        description: "Bathroom renovation - pipe work",
        location: "Maadi, Villa 25",
        price: 450.0,
        startTime: DateTime.now().subtract(Duration(hours: 3)),
        status: "in_progress",
        clientPhone: "+20444444444",
      ),
    ];

    unreadRequestsCount =
        serviceRequests.where((r) => r.status == 'pending').length;
  }

  void _simulateRealTimeUpdates() {
    // Simulate new requests coming in
    Future.delayed(Duration(seconds: 30), () {
      if (mounted) {
        _addNewRequest();
      }
    });

    // Update earnings periodically
    Future.delayed(Duration(minutes: 2), () {
      if (mounted) {
        _updateEarnings();
      }
    });
  }

  void _addNewRequest() {
    final newRequest = ServiceRequest(
      id: "REQ${DateTime.now().millisecondsSinceEpoch}",
      clientName: "New Client",
      serviceType: "Plumbing",
      description: "Urgent repair needed",
      location: "Various locations",
      offeredPrice: 150.0,
      requestTime: DateTime.now(),
      status: "pending",
      clientPhone: "+20555555555",
    );

    setState(() {
      serviceRequests.insert(0, newRequest);
      unreadRequestsCount =
          serviceRequests.where((r) => r.status == 'pending').length;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('New service request received!'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'View',
          textColor: Colors.white,
          onPressed: () => setState(() => _currentIndex = 1),
        ),
      ),
    );
  }

  void _updateEarnings() {
    setState(() {
      provider = provider.copyWith(
        rating: provider.rating + 0.1,
        completedOrders: provider.completedOrders + 1,
        walletBalance: provider.walletBalance + 75.0,
      );

      transactions.insert(
          0,
          Transaction(
            id: "T${DateTime.now().millisecondsSinceEpoch}",
            description: "Emergency repair service",
            amount: 75.0,
            date: DateTime.now(),
            type: 'earning',
            orderId: "ORD${DateTime.now().millisecondsSinceEpoch}",
          ));
    });
  }

  void _acceptRequest(ServiceRequest request) {
    setState(() {
      // Remove from requests
      serviceRequests.removeWhere((r) => r.id == request.id);

      // Add to active orders
      activeOrders.insert(
          0,
          ActiveOrder(
            id: "ORD${DateTime.now().millisecondsSinceEpoch}",
            clientName: request.clientName,
            serviceType: request.serviceType,
            description: request.description,
            location: request.location,
            price: request.offeredPrice,
            startTime: DateTime.now(),
            status: "in_progress",
            clientPhone: request.clientPhone,
          ));

      unreadRequestsCount =
          serviceRequests.where((r) => r.status == 'pending').length;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request accepted! Added to active orders.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _rejectRequest(ServiceRequest request) {
    setState(() {
      serviceRequests.removeWhere((r) => r.id == request.id);
      unreadRequestsCount =
          serviceRequests.where((r) => r.status == 'pending').length;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request rejected.'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _completeOrder(ActiveOrder order) {
    setState(() {
      activeOrders.removeWhere((o) => o.id == order.id);

      // Add earning transaction
      transactions.insert(
          0,
          Transaction(
            id: "T${DateTime.now().millisecondsSinceEpoch}",
            description: order.description,
            amount: order.price,
            date: DateTime.now(),
            type: 'earning',
            orderId: order.id,
          ));

      // Update provider stats
      provider = provider.copyWith(
        completedOrders: provider.completedOrders + 1,
        walletBalance: provider.walletBalance + order.price,
        rating: provider.rating + 0.01, // Slight rating improvement
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Order completed! \$${order.price.toStringAsFixed(2)} added to your wallet.'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _withdrawMoney(double amount) {
    if (amount <= provider.walletBalance && amount > 0) {
      setState(() {
        provider =
            provider.copyWith(walletBalance: provider.walletBalance - amount);

        transactions.insert(
            0,
            Transaction(
              id: "T${DateTime.now().millisecondsSinceEpoch}",
              description: "Bank withdrawal",
              amount: -amount,
              date: DateTime.now(),
              type: 'withdrawal',
            ));
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Withdrawal successful! \$${amount.toStringAsFixed(2)} transferred to your bank.'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _updateProfile(String name, String phone) {
    setState(() {
      provider = provider.copyWith(
        name: name,
        phoneNumber: phone,
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _toggleAvailability(bool isAvailable) {
    setState(() {
      provider = provider.copyWith(isAvailable: isAvailable);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isAvailable
              ? 'You are now available for new orders'
              : 'You are now unavailable',
        ),
        backgroundColor: isAvailable ? Colors.green : Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ProfileScreen(
        provider: provider,
        transactions: transactions,
        onUpdateProfile: _updateProfile,
        onToggleAvailability: _toggleAvailability,
        onWithdraw: _withdrawMoney,
      ),
      RequestsScreen(
        requests: serviceRequests,
        onAccept: _acceptRequest,
        onReject: _rejectRequest,
      ),
      ActiveOrdersScreen(
        orders: activeOrders,
        onComplete: _completeOrder,
      ),
      EarningsScreen(
        provider: provider,
        transactions: transactions,
        onWithdraw: _withdrawMoney,
      ),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.notifications),
                if (unreadRequestsCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$unreadRequestsCount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.work),
                if (activeOrders.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '${activeOrders.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: 'Active',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Earnings',
          ),
        ],
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatefulWidget {
  final ServiceProvider provider;
  final List<Transaction> transactions;
  final Function(String, String) onUpdateProfile;
  final Function(bool) onToggleAvailability;
  final Function(double) onWithdraw;

  const ProfileScreen({
    super.key,
    required this.provider,
    required this.transactions,
    required this.onUpdateProfile,
    required this.onToggleAvailability,
    required this.onWithdraw,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with user info and stats
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF52C41A).withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF52C41A),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.provider.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.provider.profession,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                    ),
                  ),
                  if (widget.provider.phoneNumber != null) ...[
                    SizedBox(height: 4),
                    Text(
                      widget.provider.phoneNumber!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF888888),
                      ),
                    ),
                  ],
                  SizedBox(height: 16),

                  // Rating and Work Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem(
                          'Rating',
                          widget.provider.rating.toStringAsFixed(1),
                          Icons.star,
                          Colors.orange),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      _buildStatItem(
                          'Orders',
                          widget.provider.completedOrders.toString(),
                          Icons.check_circle,
                          Color(0xFF52C41A)),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      _buildStatItem(
                          'Clients',
                          widget.provider.uniqueClients.toString(),
                          Icons.people,
                          Colors.blue),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Availability Status
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Availability Status',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.provider.isAvailable
                            ? 'Available for new orders'
                            : 'Not available',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      Switch(
                        value: widget.provider.isAvailable,
                        onChanged: widget.onToggleAvailability,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Menu Items
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.edit,
                    title: 'Edit Profile',
                    subtitle: 'Update phone number or password',
                    onTap: () => _showEditProfileDialog(),
                  ),
                  Divider(height: 1),
                  _buildMenuItem(
                    icon: Icons.account_balance_wallet,
                    title: 'Payment Wallet',
                    subtitle:
                        '\$${widget.provider.walletBalance.toStringAsFixed(2)} available',
                    onTap: () => _showPaymentWallet(),
                  ),
                  Divider(height: 1),
                  _buildMenuItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    subtitle: 'App preferences and notifications',
                    onTap: () => _showSettings(),
                  ),
                  Divider(height: 1),
                  _buildMenuItem(
                    icon: Icons.help,
                    title: 'Help & Support',
                    subtitle: 'Get help or contact support',
                    onTap: () => _showHelpSupport(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.green, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showEditProfileDialog() {
    final nameController = TextEditingController(text: widget.provider.name);
    final phoneController =
        TextEditingController(text: widget.provider.phoneNumber ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.onUpdateProfile(nameController.text, phoneController.text);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showPaymentWallet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Wallet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.green.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Balance',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${widget.provider.walletBalance.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _showWithdrawDialog,
                    icon: Icon(Icons.download),
                    label: Text('Withdraw'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.history),
                    label: Text('History'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = widget.transactions[index];
                  final isEarning = transaction.type == 'earning';

                  return ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (isEarning ? Colors.green : Colors.red)
                            .withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isEarning ? Icons.add : Icons.remove,
                        color: isEarning ? Colors.green : Colors.red,
                      ),
                    ),
                    title: Text(transaction.description),
                    subtitle: Text(
                      '${transaction.date.day}/${transaction.date.month}/${transaction.date.year} ${transaction.date.hour}:${transaction.date.minute.toString().padLeft(2, '0')}',
                    ),
                    trailing: Text(
                      '${isEarning ? '+' : ''}\$${transaction.amount.abs().toStringAsFixed(2)}',
                      style: TextStyle(
                        color: isEarning ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWithdrawDialog() {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Withdraw Money'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Available Balance: \$${widget.provider.walletBalance.toStringAsFixed(2)}'),
            SizedBox(height: 15),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount to withdraw',
                border: OutlineInputBorder(),
                prefixText: '',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0;
              if (amount > 0 && amount <= widget.provider.walletBalance) {
                widget.onWithdraw(amount);
                Navigator.pop(context);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Invalid amount'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text('Withdraw'),
          ),
        ],
      ),
    );
  }

  void _showSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Settings screen would open here')),
    );
  }

  void _showHelpSupport() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Help & Support screen would open here')),
    );
  }
}

// Dynamic Requests Screen
class RequestsScreen extends StatelessWidget {
  final List<ServiceRequest> requests;
  final Function(ServiceRequest) onAccept;
  final Function(ServiceRequest) onReject;

  const RequestsScreen({
    super.key,
    required this.requests,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Requests (${requests.length})'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: requests.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No new requests',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'New service requests will appear here',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                // Simulate refresh
                await Future.delayed(Duration(seconds: 1));
              },
              child: ListView.builder(
                padding: EdgeInsets.all(15),
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  final timeAgo = _getTimeAgo(request.requestTime);

                  return Card(
                    margin: EdgeInsets.only(bottom: 15),
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      request.clientName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      request.serviceType,
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '\${request.offeredPrice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  Text(
                                    timeAgo,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Description:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            request.description,
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.grey[600]),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  request.location,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () => onReject(request),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.red,
                                    side: BorderSide(color: Colors.red),
                                  ),
                                  child: Text('Reject'),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => onAccept(request),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text('Accept'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}

// Dynamic Active Orders Screen
class ActiveOrdersScreen extends StatelessWidget {
  final List<ActiveOrder> orders;
  final Function(ActiveOrder) onComplete;

  const ActiveOrdersScreen({
    super.key,
    required this.orders,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Orders (${orders.length})'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.work_outline, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No active orders',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Orders you accept will appear here',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final duration = DateTime.now().difference(order.startTime);
                final durationText = _formatDuration(duration);

                return Card(
                  margin: EdgeInsets.only(bottom: 15),
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.clientName,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    order.serviceType,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\${order.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'In Progress',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          order.description,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.grey[600]),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                order.location,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 16, color: Colors.grey[600]),
                            SizedBox(width: 5),
                            Text(
                              'Started $durationText ago',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        if (order.clientPhone != null) ...[
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    // Open phone dialer
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Calling ${order.clientPhone}...'),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.phone),
                                  label: Text('Call Client'),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () =>
                                      _showCompleteDialog(context, order),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                  icon: Icon(Icons.check),
                                  label: Text('Complete'),
                                ),
                              ),
                            ],
                          ),
                        ] else ...[
                          SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () =>
                                  _showCompleteDialog(context, order),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              icon: Icon(Icons.check),
                              label: Text('Mark as Complete'),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showCompleteDialog(BuildContext context, ActiveOrder order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Complete Order'),
        content: Text(
          'Are you sure you want to mark this order as complete?\n\n'
          'You will receive \${order.price.toStringAsFixed(2)} in your wallet.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              onComplete(order);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: Text('Complete'),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else {
      return '${duration.inMinutes}m';
    }
  }
}

// Dynamic Earnings Screen
class EarningsScreen extends StatelessWidget {
  final ServiceProvider provider;
  final List<Transaction> transactions;
  final Function(double) onWithdraw;

  const EarningsScreen({
    super.key,
    required this.provider,
    required this.transactions,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    final totalEarnings = transactions
        .where((t) => t.type == 'earning')
        .fold(0.0, (sum, t) => sum + t.amount);

    final totalWithdrawals = transactions
        .where((t) => t.type == 'withdrawal')
        .fold(0.0, (sum, t) => sum + t.amount.abs());

    final todayEarnings = transactions
        .where((t) => t.type == 'earning' && _isToday(t.date))
        .fold(0.0, (sum, t) => sum + t.amount);

    final thisWeekEarnings = transactions
        .where((t) => t.type == 'earning' && _isThisWeek(t.date))
        .fold(0.0, (sum, t) => sum + t.amount);

    return Scaffold(
      appBar: AppBar(
        title: Text('Earnings Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Refreshing earnings data...')),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green, Colors.green.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\${provider.walletBalance.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: provider.walletBalance > 0
                            ? () => _showWithdrawDialog(context)
                            : null,
                        icon: Icon(Icons.download),
                        label: Text('Withdraw Money'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Statistics Grid
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildEarningStat(
                    'Total Earned',
                    '\${totalEarnings.toStringAsFixed(2)}',
                    Icons.trending_up,
                    Colors.green,
                  ),
                  _buildEarningStat(
                    'Withdrawn',
                    '\${totalWithdrawals.toStringAsFixed(2)}',
                    Icons.download,
                    Colors.blue,
                  ),
                  _buildEarningStat(
                    'Today',
                    '\${todayEarnings.toStringAsFixed(2)}',
                    Icons.today,
                    Colors.orange,
                  ),
                  _buildEarningStat(
                    'This Week',
                    '\${thisWeekEarnings.toStringAsFixed(2)}',
                    Icons.date_range,
                    Colors.purple,
                  ),
                ],
              ),

              SizedBox(height: 30),

              // Transactions Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Show all transactions
                    },
                    child: Text('View All (${transactions.length})'),
                  ),
                ],
              ),

              SizedBox(height: 15),

              transactions.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Icon(
                            Icons.receipt_long,
                            size: 60,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'No transactions yet',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          transactions.length > 5 ? 5 : transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        final isEarning = transaction.type == 'earning';

                        return Card(
                          margin: EdgeInsets.only(bottom: 10),
                          elevation: 2,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(15),
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: (isEarning ? Colors.green : Colors.red)
                                    .withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isEarning
                                    ? Icons.add_circle
                                    : Icons.remove_circle,
                                color: isEarning ? Colors.green : Colors.red,
                              ),
                            ),
                            title: Text(
                              transaction.description,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _formatDateTime(transaction.date),
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                if (transaction.orderId != null)
                                  Text(
                                    'Order: ${transaction.orderId}',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                    ),
                                  ),
                              ],
                            ),
                            trailing: Text(
                              '${isEarning ? '+' : ''}\${transaction.amount.abs().toStringAsFixed(2)}',
                              style: TextStyle(
                                color: isEarning ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEarningStat(
      String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showWithdrawDialog(BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Withdraw Money'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Available Balance: \${provider.walletBalance.toStringAsFixed(2)}'),
            SizedBox(height: 15),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount to withdraw',
                border: OutlineInputBorder(),
                prefixText: '',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Minimum withdrawal: \$10.00',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text) ?? 0;
              if (amount >= 10 && amount <= provider.walletBalance) {
                onWithdraw(amount);
                Navigator.pop(context);
              } else if (amount < 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Minimum withdrawal amount is \$10.00'),
                    backgroundColor: Colors.orange,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Insufficient balance'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: Text('Withdraw'),
          ),
        ],
      ),
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
  }

  bool _isThisWeek(DateTime date) {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    return date.isAfter(weekStart) &&
        date.isBefore(weekEnd.add(Duration(days: 1)));
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} '
        '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

 