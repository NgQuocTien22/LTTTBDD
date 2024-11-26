import 'dart:core';
import 'dienthoai.dart';
import 'hoadon.dart';
import 'cuahang.dart';

void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang("Cửa Hàng Điện Thoại ABC", "123 Đường ABC");

  // Tạo các điện thoại mẫu
  DienThoai dienThoai1 =
      DienThoai("DT-001", "iPhone 15", "Apple", 10000, 12000, 50, true);
  DienThoai dienThoai2 =
      DienThoai("DT-002", "Galaxy S24", "Samsung", 8000, 9500, 30, true);
  DienThoai dienThoai3 =
      DienThoai("DT-003", "Xiaomi 14", "Xiaomi", 6000, 7500, 20, true);

  // Thêm điện thoại vào cửa hàng
  cuaHang.themDienThoai(dienThoai1);
  cuaHang.themDienThoai(dienThoai2);
  cuaHang.themDienThoai(dienThoai3);

  // Hiển thị danh sách điện thoại
  print("Danh sách điện thoại trong cửa hàng:");
  cuaHang.hienThiDanhSachDienThoai();

  // Cập nhật thông tin điện thoại
  print("\nCập nhật thông tin điện thoại iPhone 15:");
  dienThoai1.tenDienThoai = "iPhone 15 Pro Max"; // Cập nhật tên điện thoại
  dienThoai1.giaBan = 13000; // Cập nhật giá bán
  cuaHang.capNhatDienThoai(dienThoai1);

  // Hiển thị danh sách điện thoại sau khi cập nhật
  cuaHang.hienThiDanhSachDienThoai();

  // Ngừng kinh doanh một điện thoại
  print("\nNgừng kinh doanh điện thoại Xiaomi 14:");
  cuaHang.ngungKinhDoanh(dienThoai3);
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn bán hàng
  HoaDon hoaDon1 = HoaDon("HD-001", DateTime.now(), dienThoai1, 5, 12500,
      "Nguyễn Văn A", "0987654321");
  HoaDon hoaDon2 = HoaDon(
      "HD-002", DateTime.now(), dienThoai2, 3, 9500, "Lê Thị B", "0912345678");

  // Tạo hóa đơn trong cửa hàng
  cuaHang.taoHoaDon(hoaDon1);
  cuaHang.taoHoaDon(hoaDon2);

  // Hiển thị danh sách hóa đơn
  print("\nDanh sách hóa đơn:");
  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê doanh thu và lợi nhuận
  double doanhThu = cuaHang.tinhDoanhThu();
  double loiNhuan = cuaHang.tinhLoiNhuan();
  print("\nTổng doanh thu: \$${doanhThu}");
  print("Tổng lợi nhuận: \$${loiNhuan}");

  // Thống kê top bán chạy
  print("\nThống kê top điện thoại bán chạy:");
  cuaHang.thongKeTopBanChay();

  // Thống kê tồn kho
  print("\nThống kê tồn kho:");
  cuaHang.thongKeTonKho();
}
