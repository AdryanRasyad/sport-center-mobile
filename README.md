TUGAS 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Widget tree adalah struktur yang menggambarkan bagaimana semua elemen UI saling berhubungan. Setiap tampilan di flutter dibangun dari kumpulan widget yang tersusun seperti cabang pohon, mulai dari widget utama sebagai akar sampai widget terkecil seperti daun. Setiap widget berperan sebagai parent yang bisa menampung child di dalamnya. Parent widget bertanggung jawab mengatur tata letak, posisi, dan gaya dari widget anak, sedangkan child widget menampilkan konten yang lebih spesifik, seprti Text, Icon, Image, dan lainnya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    Dalam proyek ini saya menggunakan berbagai widget Flutter dengan fungsi masing-masing. Scaffold berperan sebagai struktur utama halaman yang memuat AppBar dan body. AppBar menampilkan judul aplikasi di bagian atas. Text digunakan untuk menampilkan teks seperti judul dan pesan sambutan. Padding memberikan jarak di sekitar elemen agar tata letak lebih rapi. Column menyusun widget secara vertikal, sedangkan Center memposisikan widget di tengah layar. GridView.count digunakan untuk menampilkan kumpulan tombol dalam bentuk grid tiga kolom. Setiap tombol direpresentasikan oleh ItemCard, yang dibangun dengan widget Material sebagai latar kartu dan InkWell untuk membuatnya bisa ditekan dengan efek jika diklik. Di dalamnya terdapat Container yang mengatur padding serta tata letak Icon dan Text agar tampil di tengah kartu. Ketika tombol ditekan, SnackBar ditampilkan melalui ScaffoldMessenger untuk memberikan pesan interaktif kepada user. Selain itu, terdapat kelas ItemHomepage sebagai model data sederhana yang menyimpan nama dan ikon dari setiap tombol.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    MaterialApp berperan sebagai root widget yang menggunakan komponen Material Design. MaterialApp menyediakan berbagai fitur, seperti :
        - Theme : warna, font, dan style yang berlaku secara global.
        - Navigation & Routing
        - Localization
        - Integrasi dengan widget dasar Material Design.
    Widget ini sering dipakai karena menjadi titik awal yang menyiapkan seluruhn Material design di bawahnya. Jika tidak ada MaterialApp, maka banyak widget yang tidak akan berfungsi.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    StatelessWidget adalah widget yang tampilannya tetap dan tidak bisa berubah setelah dibuat. Biasanya digunakan untuk menampilkan hal-hal yang statis, seperti teks, ikon, atau tampilan sederhana yang tidak bergantung pada interaksi pengguna. Sedangkan, StatefulWidget adalah widget yang bisa berubah sesuai kondisi atau interaksi pengguna. Widget ini punya state yang bisa diperbarui menggunakan fungsi setState(), sehingga tampilannya bisa berubah tanpa harus membuat ulang seluruh halaman. Contohnya, ketika pengguna menekan tombol dan angka pada layar bertambah, itu berarti widget tersebut bersifat stateful. Jadi, StatelessWidget dipakai ketika tampilan tidak berubah. Sedangkan, StatefulWidget dipakai ketika tampilan bisa berubah karena interaksi atau data baru.

5.  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext adalah sebuah objek yang digunakan oleh Flutter untuk mengetahui letak atau posisi suatu widget dalam struktur widget tree. BuilContext penting di flutter karena digunakan untuk mengakses berbagai informasi yang berkaitan dengan tampilan. Penggunaannya di metode build adalah BuildContext. digunakan agar widget bisa membangun tampilannya sesuai dengan posisi dan konteksnya di dalam tree. Jika tidak ada BuildContext, maka widget tidak bisa berinteraksi dengan widget lain atau menyesuaikan tampilannya dengan benar di aplikasi Flutter.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    Hot Reload dalah fitur di flutter yang memungkinkan developer untuk melihat hasil perubahan kode secara langsung tanpah harus quit dari aplikasi kemudian run lagi. Saat hot reload, Flutter hanya memperbarui bagian kode yang berubah dan mempertahankan state aplikasi, seperti variabel, posisi halaman, atau input pengguna yang sedang aktif. Sedangkan, hot restart juga memuat ulang aplikasi, tetapi mengulang seluruh proses dari awal, termasuk menghapus semua state yang sedang berjalan.

TUGAS 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    Navigator.push() menambahkan route ke paling atas stack sehingga route tersebut akan muncul dan ditampilkan ke user. Sedangkan, Navigator.pushReplacement() menghapus route yang sedang ditampilkan ke user dan menggantinya ke route lain, tanpa mengubah kondisi elemen stack di bawahnya. Pada Navigator.push(), halaman sebelumnya masih tersimpan di dalam stack sehingga user dapat kembali ke halaman tersebut. Misalnya kalua dalam aplikasi Football Shop saya adalah saat berpindah dari homepage ke form. Sebaliknya, Navigator.pushReplacement() digunakan ketika halaman sebelumnya tidak lagi relevan untuk diakses, karena halaman baru sepenuhnya menggantikannya di stack. Dalam Sport Center, Navigator.pushReplacement() dipakai saat navigasi ke home page.

2.  Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    Setiap halaman utama, seperti MyHomePage dan ProductFormPage, menggunakan Scaffold sebagai kerangka utama, seperti area untuk AppBar, Drawer, dan body. Widget AppBar digunakan untuk menampilkan judul halaman, seperti “Sport Center” atau “Add Product Form”, sehingga pengguna dapat mengetahui konteks halaman yang sedang diakses. Selain itu, Drawer yang diimplementasikan melalui widget LeftDrawer berfungsi sebagai navigasi yang muncul di semua halaman, sehingga pengguna berpindah antarhalaman dengan mudah. Dengan memanfaatkan ketiga widget ini secara terintegrasi, aplikasi memiliki tata letak yang seragam, mudah digunakan, serta memberikan user experience yang terstruktur.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    Dalam konteks desain antarmuka, penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView memberikan kelebihan penting dalam hal kenyamanan tampilan, keterbacaan, serta responsivitas antarmuka, terutama saat menampilkan elemen-elemen form yang kompleks dan panjang seperti pada aplikasi Sport Center.

    Widget Padding digunakan untuk memberikan jarak di sekitar elemen form agar tampilan tidak terlalu rapat dan tetap nyaman dilihat. Misalnya, pada setiap field input seperti Product Name dan Price, terdapat potongan kode seperti Padding(padding: const EdgeInsets.all(8.0), child: TextFormField(...)) yang membuat setiap elemen form memiliki ruang antarbagian, sehingga pengguna dapat dengan mudah membedakan satu input dengan input lainnya.

    Kemudian, SingleChildScrollView digunakan untuk memungkinkan seluruh isi form di-scroll ketika konten melebihi tinggi layar. Ini sangat penting agar user tetap dapat mengakses semua bagian form, terutama pada perangkat dengan ukuran layar kecil. Dalam kode, form dibungkus dengan SingleChildScrollView(child: Column(...)), sehingga saat halaman form panjang, user bisa scroll ke bawah tanpa ada elemen yang terpotong.

    Sementara itu, ListView atau konsep yang sama dengan ListView (seperti ListView di dalam Drawer) digunakan untuk menampilkan daftar elemen yang bisa di-scroll secara vertikal secara efisien. Misalnya, pada LeftDrawer, ListView digunakan untuk menyusun elemen navigasi seperti Home dan Add Product agar tetap bisa diakses meskipun jumlah menu bertambah dan melebihi panjang layar.

4. 
    Dalam kode aplikasi Sport Center ini, penyesuaian warna tema dilakukan melalui pengaturan ThemeData dan ColorScheme di file main.dart agar seluruh tampilan aplikasi memiliki identitas visual yang konsisten dengan brand toko. Warna utama (primary color) dan warna sekunder (secondary color) dipilih dan didefinisikan secara eksplisit sehingga setiap elemen antarmuka—seperti AppBar, Drawer, tombol, dan kartu produk—menampilkan nuansa warna yang sama. Misalnya, pada kode colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(0xFF2E7D32, {...})).copyWith(secondary: Color(0xFF4CAF50)), warna hijau tua (0xFF2E7D32) digunakan sebagai warna utama.

    Dengan memanfaatkan Theme.of(context).colorScheme.primary dan Theme.of(context).colorScheme.secondary di seluruh file seperti menu.dart, left_drawer.dart, dan product_form.dart, setiap komponen aplikasi otomatis menyesuaikan warna sesuai tema yang sudah ditetapkan.


Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    Karena Flutter menggunakan bahasa Dart yang strongly-typed, kita membutuhkan model kelas Dart (misalnya ProductEntry) untuk menghubungkan JSON ke objek Dart yang aman dan konsisten. Model Dart memberi keamanan tipe, null-safety, kemudahan pemeliharaan, parsing terpusat, dan kode yang bersih, sementara Map<String, dynamic> menyebabkan aplikasi mudah error, sulit dirawat, dan tidak aman.

2.  Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
    Pacakge http digunakan untuk akses endpoint publik. Http hany mengirim request tanpa session dan umumnya dipakai untuk fitur read-only. Selain itu, http tidak otomatis membawa cookie login, kecuali ditambahkan secsara manual. Sedangkan, CookieRequest adalah wrapper khusus yang digunakan untuk semua API yang memerlukan login karena ia menyimpan dan mengirimkan cookie sesi Django secara otomatis. CookieRequest juga dipakai untuk POST/GET yang memerlukan autentikasi.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    CookieRequest perlu dibagikan ke semua komponen aplikasi karena ia menyimpan session cookie Django yang menentukan identitas pengguna. Agar seluruh halaman tetap mengenali user yang sama dan bisa mengakses endpoint yang membutuhkan autentikasi, harus ada satu instance CookieRequest global yang digunakan bersama. Jika setiap widget membuat instance baru, session akan hilang, pengguna seakan-akan udah logout, dan komunikasi dengan backend menjadi tidak konsisten.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
    1) Menambahkan 10.0.2.2 pada ALLOWED_HOST
        Saat menggunakan Android Emulator, alamat localhost pada perangkat Android sebenarnya merujuk ke emulator, bukan ke laptop tempat Django berjalan. Supaya django mengizinkan host tersebut, kita harus menambahkan 10.0.2.2 pada ALLOWED-HOST.
    2) Mengaktifkan CORS (Cross-Origin Resource Sharing)
        Browser memiliki aturan keamanan Same-Origin Policy yang mencegah aplikasi memanggil API dari domain lain tanpa izin eksplisit. Jika tidak dilakukan, rowser akan memblokir request sebelum sampai ke Django dan Error muncul di console Flutter Web.
    3) Pengaturan SameSite/cookie
        cookie lintas-origin harus memiliki aturan:
            ON_COOKIE_SAMESITE = "None"
            SESSION_COOKIE_SECURE = True
        Jika tidak, cookie tidak dikirim kembali ke Django, login berhasil tapi request berikutnya dianggap tidak login, flutter tidak dapat mengakses endpoint yang memerlukan autentikasi, halaman “My Products” akan selalu kosong, create Product dianggap unauthorized
    4) Menambahkan izin internet di Android
        Aplikasi Flutter Android tidak boleh mengakses internet tanpa izin. Tanpa izin, semua request HTTP akan gagal dan Flutter tidak bisa mengambil data, tidak bisa login, dan tidak bisa memuat gambar.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    1) Input dari user
        Contohnya, dalam proyek ini, user bisa menginput nama produk, harga, deskripsi, thumbnail, dan is_featured pada form. Setelah itu, user menekan save product (_formKey.currentState!.save(); dan _formKey.currentState!.validate();) sehingga data tersimpan ke variabel _name, _price, _description, _category, _thumbnail, _isFeatured.
    2) Flutter mengirim data ke Django
        Setelah validasi, Flutter mengirim JSON menggunakan CookieRequest:
            final response = await request.postJson(
            "http://localhost:8000/create-flutter/",
            jsonEncode({
                "name": _name,
                "price": _price,
                "description": _description,
                "category": _category,
                "thumbnail": _thumbnail,
                "is_featured": _isFeatured,
                }),
            );
        Penggunaan CookieRequest membuat request memuat session cookie (untuk identitas user), header JSON, dan body JSON sehingga Django mengetahui bahwa produk tersebut adalah milik user terkait yang login.
    3) Django menerima request dan memproses data
        Django menerima request di views.py yang diproses dengan:
            name = strip_tags(data.get("name", ""))
            price = int(data.get("price", 0))
            description = strip_tags(data.get("description", ""))
            category = data.get("category", "")
            thumbnail = data.get("thumbnail", "")
            is_featured = data.get("is_featured", False)
            user = request.user
        Django akan membaut objek, dan objek tersebut disimpan di database.
    4) Flutter mengambil data dari Django untuk ditampilkan
        Saat user membuka halaman "All Products" atau "My Products", Flutter menjalankan:
            final response = await request.get("http://localhost:8000/json/");
        atau kalau untuk produk user saja:
            http://localhost:8000/json/my-products/
    5) Flutter mengubah JSON menjadi Model Dart
        Flutter mengubah JSON ke dalam object Dart:
            ProductEntry.fromJson(d)
    6) Flutter menampilkan data
        Dalam card, image ditampilkan dari product.thumbnail dan nama / kategori / fitur ditampilkan menggunakan product.name, dll

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter
    - Register
        1) User input form di Flutter
        2) Flutter mengirim POST ke django
            Flutter mengirim JSON menggunakan:
            request.post("http://localhost:8000/auth/register/", {
            'username': username,
            'password1': password1,
            'password2': password2,
            });
        3) Django menerima data di view register
            Django menerima request POST, memvalidasi password, username, duplikasi, aturan keamanan. Jika, valid baru disimpan ke database
        4) Django mengembalikan response JSON
    - Login
        1) User mengisi username dan password di Flutter
        2) Flutter mengirim POST login ke Django
        3) Django memproses login
        4) CookieRequest menyimpan session cookie
        5) Flutter menampilkan menu setelah login
    - Logout
        1) User menekan tombol Logout 
        2) Django memproses logout : logout(request)
        3) CookieRequest membersihkan session lokal
        4) Flutter mengalihkan user ke halaman login

7. Penjelasan langkah-langkah checklist
    1) Pertama, saya menyesuaikan pengaturan konektivitas: menambahkan 10.0.2.2 ke ALLOWED_HOSTS untuk Android emulator, mengaktifkan django-cors-headers dengan CORS_ALLOW_CREDENTIALS = True dan set SESSION_COOKIE_SAMESITE = 'None' serta SESSION_COOKIE_SECURE = True (pada deployment HTTPS) sehingga cookie session dikirim lintas-origin. Di AndroidManifest.xml saya menambahkan <uses-permission android:name="android.permission.INTERNET"/>. 

    2) Untuk fitur registrasi pada Flutter saya membuat halaman register (register.dart) dengan validasi cek password match. Ketika tombol register ditekan, saya memanggil request.postJson(".../auth/register/", jsonEncode({...})) dan menampilkan feedback kepada pengguna (snackbar/alert). Saya juga menambahkan navigasi otomatis ke halaman login jika pendaftaran berhasil.

    3) Untuk halaman login, cukup mirip dengan tutorial. Setelah login sukses saya melakukan Navigator.pushReplacement ke halaman utama sehingga user langsung melihat menu aplikasi yang sesuai.

    4) Untuk mengintegrasikan sistem autentikasi Django dengan Flutter, saya mendaftarkan Provider(create: (_) => CookieRequest()) di main.dart sehingga satu instance CookieRequest tersedia untuk seluruh widget tree. Semua request yang membutuhkan autentikasi (create product, my-products, logout) saya jalankan melalui instance ini supaya session cookie dikirim otomatis.

    5) Saya membuat model custom di Flutter (product_entry.dart) sesuai struktur JSON yang dikembalikan Django: field id, name, price (int), description, category, thumbnail, views, created_at, is_featured, user_id, user_username.

    6) Pada Django saya menambahkan endpoint JSON yang mengembalikan semua item (/json/) dan endpoint untuk item khusus user (/json/my-products/) dengan struktur JSON yang sudah distandarkan. Saya juga menambahkan view proxy_image untuk melewati masalah CORS pada thumbnail eksternal sehingga Flutter selalu memanggil http://<host>/proxy-image/?url=... untuk memuat gambar.

    7) Untuk halaman daftar item (list) di Flutter (product_entry_list.dart) saya menggunakan FutureBuilder yang memanggil API melalui CookieRequest.get dan mengubah setiap JSON menjadi instance ProductEntry. Saya juga membuat ProductEntryCard untuk menampilkan thumbnail, name, category, snippet description, dan badge Featured. Setiap card memiliki onTap yang menavigasi ke halaman detail item.

    8) Halaman detail (product_detail.dart) menampilkan seluruh atribut model: gambar besar (proxy-image), judul, kategori, tanggal, views, description penuh, dan tombol kembali.

    9) Untuk filter “My Products” saya menambahkan logika di Django (filter by request.user) dan membuat dua tombol/aksi di UI: “All Products” memanggil /json/, sedangkan “My Products” memanggil /json/my-products/.

    10) Form pembuatan produk (product_form.dart) saya buat dengan validasi dan pengecekan URL thumbnail. Pada response sukses saya menampilkan snackbar dan redirect ke halaman utama.


        


