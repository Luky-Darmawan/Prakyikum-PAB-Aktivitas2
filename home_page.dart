import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data hewan per kategori
  static const Map<String, List<Map<String, dynamic>>> dataHewan = {
    'Kucing': [
      {
        'nama': 'Luna',
        'ras': 'British Shorthair',
        'umur': '3 Bulan',
        'divaksin': true,
        'deskripsi':
            'Luna adalah anak kucing yang sangat tenang dan suka bermanja-manja. Dia sudah terbiasa dengan lingkungan apartemen dan sangat cocok untuk keluarga yang tinggal di dalam ruangan.',
        'image': 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=800',
      },
      {
        'nama': 'Mochi',
        'ras': 'Persian',
        'umur': '6 Bulan',
        'divaksin': true,
        'deskripsi':
            'Mochi adalah kucing Persia yang lembut dan suka dipeluk. Bulunya yang lebat membutuhkan perawatan rutin, namun karakternya sangat penyayang.',
        'image': 'https://images.unsplash.com/photo-1543852786-1cf6624b9987?w=800',
      },
    ],
    'Anjing': [
      {
        'nama': 'Rocky',
        'ras': 'Golden Retriever',
        'umur': '8 Bulan',
        'divaksin': true,
        'deskripsi':
            'Rocky adalah anjing yang sangat aktif dan suka bermain. Dia sangat ramah dengan anak-anak dan cocok untuk keluarga yang aktif.',
        'image': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=800',
      },
      {
        'nama': 'Buddy',
        'ras': 'Beagle',
        'umur': '1 Tahun',
        'divaksin': false,
        'deskripsi':
            'Buddy adalah anjing Beagle yang energik dan penasaran. Dia suka menjelajahi lingkungan sekitar dan sangat setia pada pemiliknya.',
        'image': 'https://images.unsplash.com/photo-1505628346881-b72b27e84530?w=800',
      },
    ],
    'Kelinci': [
      {
        'nama': 'Snowy',
        'ras': 'Holland Lop',
        'umur': '4 Bulan',
        'divaksin': false,
        'deskripsi':
            'Snowy adalah kelinci berbulu putih yang sangat jinak. Dia suka dielus dan sangat cocok untuk anak-anak yang ingin memiliki hewan peliharaan pertama.',
        'image': 'https://images.unsplash.com/photo-1585110396000-c9ffd4e4b308?w=800',
      },
    ],
    'Burung': [
      {
        'nama': 'Rio',
        'ras': 'Lovebird',
        'umur': '5 Bulan',
        'divaksin': false,
        'deskripsi':
            'Rio adalah burung Lovebird yang ceria dan aktif. Warna bulunya yang cerah dan kicauannya yang merdu membuat suasana rumah menjadi lebih hidup.',
        'image': 'https://images.unsplash.com/photo-1552728089-57bdde30beb3?w=800',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1450778869180-41d0601e046e?w=800',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PetAdopt',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Find your best friend',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Grid Kategori
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildCategoryCard(
                      context,
                      label: 'Kucing',
                      icon: Icons.pets,
                      color: const Color(0xFFFFF3E0),
                      iconColor: const Color(0xFFE65100),
                    ),
                    _buildCategoryCard(
                      context,
                      label: 'Anjing',
                      icon: Icons.emoji_nature,
                      color: const Color(0xFFFFF3E0),
                      iconColor: const Color(0xFFE65100),
                    ),
                    _buildCategoryCard(
                      context,
                      label: 'Kelinci',
                      icon: Icons.cruelty_free,
                      color: const Color(0xFFFFF3E0),
                      iconColor: const Color(0xFFE65100),
                    ),
                    _buildCategoryCard(
                      context,
                      label: 'Burung',
                      icon: Icons.flutter_dash,
                      color: const Color(0xFFFFF3E0),
                      iconColor: const Color(0xFFE65100),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryListPage(
              kategori: label,
              hewanList: dataHewan[label] ?? [],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman daftar hewan per kategori
class CategoryListPage extends StatelessWidget {
  final String kategori;
  final List<Map<String, dynamic>> hewanList;

  const CategoryListPage({
    super.key,
    required this.kategori,
    required this.hewanList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(kategori),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hewanList.length,
        itemBuilder: (context, index) {
          final hewan = hewanList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    namaHewan: hewan['nama'],
                    ras: hewan['ras'],
                    umur: hewan['umur'],
                    deskripsi: hewan['deskripsi'],
                    imageUrl: hewan['image'],
                    divaksin: hewan['divaksin'],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Foto
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.network(
                      hewan['image'],
                      width: 100,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100,
                        height: 90,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.pets, color: Colors.grey),
                      ),
                    ),
                  ),
                  // Info
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                hewan['nama'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (hewan['divaksin'])
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7BC67E),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    'Vaksin',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hewan['ras'],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            hewan['umur'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.chevron_right, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}