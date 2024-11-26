import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter và Setter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  // Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  void capNhatDienThoai(DienThoai dienThoai) {
    var index = _danhSachDienThoai
        .indexWhere((dt) => dt.maDienThoai == dienThoai.maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index] = dienThoai;
    }
  }

  void ngungKinhDoanh(DienThoai dienThoai) {
    var index = _danhSachDienThoai
        .indexWhere((dt) => dt.maDienThoai == dienThoai.maDienThoai);
    if (index != -1) {
      _danhSachDienThoai[index].trangThaiKinhDoanh = false;
    }
  }

  void hienThiDanhSachDienThoai() {
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
    // Cập nhật tồn kho trong DienThoai
    hoaDon.dienThoai.soLuongTon -= hoaDon.soLuongMua;
  }

  void hienThiDanhSachHoaDon() {
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
    }
  }

  // Thống kê
  double tinhDoanhThu() {
    return _danhSachHoaDon.fold(
        0.0, (sum, hoaDon) => sum + hoaDon.tinhTongTien());
  }

  double tinhLoiNhuan() {
    return _danhSachHoaDon.fold(
        0.0, (sum, hoaDon) => sum + hoaDon.tinhLoiNhuanThucTe());
  }

  void thongKeTopBanChay() {
    var dienThoaiBanChay = <String, int>{};
    for (var hoaDon in _danhSachHoaDon) {
      dienThoaiBanChay[hoaDon.dienThoai.maDienThoai] =
          (dienThoaiBanChay[hoaDon.dienThoai.maDienThoai] ?? 0) +
              hoaDon.soLuongMua;
    }

    var sorted = dienThoaiBanChay.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    for (var entry in sorted) {
      print('Điện thoại ${entry.key} bán được ${entry.value} chiếc');
    }
  }

  void thongKeTonKho() {
    for (var dt in _danhSachDienThoai) {
      print('Điện thoại ${dt.maDienThoai}: ${dt.soLuongTon} chiếc');
    }
  }
}
