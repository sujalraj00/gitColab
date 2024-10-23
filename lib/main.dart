// lib/main.dart
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Collab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// lib/screens/search_screen.dart


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Repositories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search repositories...',
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 10, // Replace with actual data
              itemBuilder: (context, index) {
                return RepositoryCard(
                  repoName: 'Flutter Project $index',
                  description: 'This is a sample repository description',
                  stars: '100',
                  forks: '50',
                  language: 'Dart',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// lib/widgets/repository_card.dart


class RepositoryCard extends StatelessWidget {
  final String repoName;
  final String description;
  final String stars;
  final String forks;
  final String language;

  const RepositoryCard({
    required this.repoName,
    required this.description,
    required this.stars,
    required this.forks,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.book, size: 20),
                SizedBox(width: 8),
                Text(
                  repoName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.star_border, size: 16),
                SizedBox(width: 4),
                Text(stars),
                SizedBox(width: 16),
                Icon(Icons.fork_right, size: 16),
                SizedBox(width: 4),
                Text(forks),
                SizedBox(width: 16),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4),
                Text(language),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// lib/screens/chat_screen.dart


class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('U${index + 1}'),
            ),
            title: Text('User ${index + 1}'),
            subtitle: Text('Last message...'),
            trailing: Text('2:30 PM'),
            onTap: () {
              // Navigate to chat detail
            },
          );
        },
      ),
    );
  }
}

// lib/screens/profile_screen.dart


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Text(
              '@johndoe',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('My Repositories'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Starred'),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Following'),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/screens/home_screen.dart


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Collab'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Text(
                'Welcome back,',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),

              // Quick Actions
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAction(
                        context,
                        icon: Icons.search,
                        label: 'Search',
                        onTap: () {
                          // Navigate to search
                        },
                      ),
                      _buildQuickAction(
                        context,
                        icon: Icons.add_circle_outline,
                        label: 'New Project',
                        onTap: () {
                          // Create new project
                        },
                      ),
                      _buildQuickAction(
                        context,
                        icon: Icons.people_outline,
                        label: 'Collaborate',
                        onTap: () {
                          // Open collaboration options
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Trending Repositories Section
              _buildSectionHeader(context, 'Trending Repositories'),
              SizedBox(height: 8),
              _buildTrendingRepositoriesList(),
              SizedBox(height: 24),

              // Recently Viewed Section
              _buildSectionHeader(context, 'Recently Viewed'),
              SizedBox(height: 8),
              _buildRecentlyViewedList(),
              SizedBox(height: 24),

              // Suggested Collaborators Section
              _buildSectionHeader(context, 'Suggested Collaborators'),
              SizedBox(height: 8),
              _buildSuggestedCollaboratorsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            // View all items
          },
          child: Text('View All'),
        ),
      ],
    );
  }

  Widget _buildTrendingRepositoriesList() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 280,
            margin: EdgeInsets.only(right: 16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Text('R${index + 1}'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Repository ${index + 1}',
                                style: Theme.of(context).textTheme.titleMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'owner/repo-name',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'A trending repository with amazing features and clean code architecture.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star_border, size: 16),
                        SizedBox(width: 4),
                        Text('1.2k'),
                        SizedBox(width: 16),
                        Icon(Icons.fork_right, size: 16),
                        SizedBox(width: 4),
                        Text('234'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentlyViewedList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: EdgeInsets.only(right: 16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project ${index + 1}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Viewed 2h ago',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.book, size: 16),
                        SizedBox(width: 4),
                        Text('Flutter'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuggestedCollaboratorsList() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      child: Text('U${index + 1}'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'User ${index + 1}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}