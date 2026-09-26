class TaiKhoan {
  final String chuTaiKhoan;
  double soDu;

  TaiKhoan(this.chuTaiKhoan, {this.soDu = 0});

  void napTien(double soTien) {
    soDu += soTien;
    print('$chuTaiKhoan nap $soTien, so du moi: $soDu');
  }

  bool rutTien(double soTien) {
    if (soTien > soDu) {
      print('$chuTaiKhoan rut that bai: khong du so du');
      return false;
    }

    soDu -= soTien;
    return true;
  }

  @override
  String toString() => 'TaiKhoan($chuTaiKhoan, so du: $soDu)';
}

class TaiKhoanTietKiem extends TaiKhoan {
  final double laiSuatNam;

  TaiKhoanTietKiem(
    super.chuTaiKhoan,
    this.laiSuatNam, {
    super.soDu,
  });

  void congLaiThang() {
    final tien = soDu * laiSuatNam / 12;
    napTien(tien);
  }

  @override
  bool rutTien(double soTien) {
    print('Luu y: rut tu tai khoan tiet kiem co the mat lai suat.');
    return super.rutTien(soTien);
  }
}

abstract class CoTheInSaoKe {
  String inSaoKe();
}

class TaiKhoanThanhToan extends TaiKhoan implements CoTheInSaoKe {
  TaiKhoanThanhToan(
    super.chuTaiKhoan, {
    super.soDu,
  });

  @override
  String inSaoKe() =>
      'Sao ke: $chuTaiKhoan - So du hien tai: $soDu';
}

mixin GhiNhatKy {
  final List<String> nhatKy = [];

  void ghi(String noiDung) {
    nhatKy.add(noiDung);
    print('[LOG] $noiDung');
  }
}

class TaiKhoanVIP extends TaiKhoan with GhiNhatKy {
  TaiKhoanVIP(
    super.chuTaiKhoan, {
    super.soDu,
  });

  @override
  void napTien(double soTien) {
    super.napTien(soTien);
    ghi('Nap $soTien vao tai khoan VIP');
  }
}

void main() {
  final tk = TaiKhoan(
    'Nguyen Van A',
    soDu: 1000000,
  );

  print(tk);

  tk.napTien(500000);
  tk.rutTien(200000);

  final tkTietKiem = TaiKhoanTietKiem(
    'Tran Thi B',
    0.06,
    soDu: 10000000,
  );

  tkTietKiem.congLaiThang();
  tkTietKiem.rutTien(1000000);

  final tkThanhToan = TaiKhoanThanhToan(
    'Le Van C',
    soDu: 5000000,
  );

  print(tkThanhToan.inSaoKe());

  final tkVIP = TaiKhoanVIP(
    'Pham Van D',
    soDu: 20000000,
  );

  tkVIP.napTien(5000000);
}
