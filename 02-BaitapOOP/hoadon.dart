import 'dienthoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  // Getter và Setter
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isEmpty || !RegExp(r"^HD-\d{3}$").hasMatch(value)) {
      throw Exception("Mã hóa đơn không hợp lệ");
    }
    _maHoaDon = value;
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isAfter(DateTime.now()))
      throw Exception("Ngày bán không được sau ngày hiện tại");
    _ngayBan = value;
  }

  DienThoai get dienThoai => _dienThoai;
  set dienThoai(DienThoai value) {
    _dienThoai = value;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value <= 0) throw Exception("Số lượng mua phải lớn hơn 0");
    if (value > _dienThoai.soLuongTon) throw Exception("Không đủ số lượng tồn");
    _soLuongMua = value;
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value <= 0) throw Exception("Giá bán thực tế phải lớn hơn 0");
    _giaBanThucTe = value;
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isEmpty) throw Exception("Tên khách hàng không được rỗng");
    _tenKhachHang = value;
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (!RegExp(r"^\d{10}$").hasMatch(value))
      throw Exception("Số điện thoại không hợp lệ");
    _soDienThoaiKhach = value;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  void hienThiThongTin() {
    print(
        "Mã hóa đơn: $_maHoaDon, Ngày bán: $_ngayBan, Điện thoại: ${_dienThoai.tenDienThoai}, Số lượng: $_soLuongMua, Giá bán thực tế: $_giaBanThucTe, Khách hàng: $_tenKhachHang, SDT: $_soDienThoaiKhach");
  }
}
