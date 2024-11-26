class DienThoai {
  // Các thuộc tính
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThaiKinhDoanh;

  // Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThaiKinhDoanh);

  // Getter và Setter
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String value) {
    if (value.isEmpty || !RegExp(r"^DT-\d{3}$").hasMatch(value)) {
      throw Exception("Mã điện thoại không hợp lệ");
    }
    _maDienThoai = value;
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String value) {
    if (value.isEmpty) throw Exception("Tên điện thoại không được rỗng");
    _tenDienThoai = value;
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String value) {
    if (value.isEmpty) throw Exception("Hãng sản xuất không được rỗng");
    _hangSanXuat = value;
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double value) {
    if (value <= 0) throw Exception("Giá nhập phải lớn hơn 0");
    _giaNhap = value;
  }

  double get giaBan => _giaBan;
  set giaBan(double value) {
    if (value <= 0 || value <= _giaNhap)
      throw Exception("Giá bán phải lớn hơn giá nhập");
    _giaBan = value;
  }

  int get soLuongTon => _soLuongTon;
  set soLuongTon(int value) {
    if (value < 0) throw Exception("Số lượng tồn phải lớn hơn hoặc bằng 0");
    _soLuongTon = value;
  }

  bool get trangThaiKinhDoanh => _trangThaiKinhDoanh;
  set trangThaiKinhDoanh(bool value) {
    _trangThaiKinhDoanh = value;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print(
        "Mã: $_maDienThoai, Tên: $_tenDienThoai, Hãng: $_hangSanXuat, Giá nhập: $_giaNhap, Giá bán: $_giaBan, Số lượng tồn: $_soLuongTon, Trạng thái: $_trangThaiKinhDoanh");
  }
}
