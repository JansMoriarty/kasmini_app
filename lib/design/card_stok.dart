import 'package:flutter/material.dart';

class CardStok extends StatelessWidget {
  const CardStok({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar perangkat
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: StokCard(screenWidth: screenWidth, screenHeight: screenHeight),
    );
  }
}

class StokCard extends StatelessWidget {
  const StokCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.001,
          vertical: screenHeight * 0.01,
        ),
        child: Container(
          height: screenHeight * 0.16, // Tinggi container relatif
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color.fromARGB(183, 88, 85, 254),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(67, 0, 0, 0),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Kolom Informasi
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Membuat teks responsif
                    SizedBox(
                      width: screenWidth * 0.5, // Lebar relatif
                      child: Text(
                        'Indomie',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight * 0.02,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: screenHeight * 0.018,
                          color: Color.fromARGB(161, 217, 217, 217),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          '11.09',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(159, 217, 217, 217),
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: Color.fromARGB(152, 217, 217, 217),
                          size: screenHeight * 0.018,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          '01/01/2008',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(130, 217, 217, 217),
                            fontSize: screenHeight * 0.016,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    
              // Kontainer Putih dengan Ikon
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.042),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.046,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            '+ 28(s)',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff5755fe),
                              fontSize: screenHeight * 0.016,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: screenHeight * 0.03,
                      ),
                      onPressed: () {
                        debugPrint('Item deleted');
                      },
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
}
