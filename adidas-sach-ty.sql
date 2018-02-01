DROP DATABASE IF EXISTS DBADIDAS;
CREATE DATABASE DBADIDAS;
USE DBADIDAS;

CREATE TABLE LOAINHANVIEN(
    MALOAINV INT AUTO_INCREMENT,
    TENLOAINV NVARCHAR(50),

    CONSTRAINT LOAINHANVIEN_MALOAINV PRIMARY KEY (MALOAINV)
);

CREATE TABLE CHODUYETKH(
    MAKH INT AUTO_INCREMENT,
    TENKH NVARCHAR(50) NOT NULL,
    SDT VARCHAR(13) NOT NULL,
    DIACHI NVARCHAR(200) NOT NULL,
    MK VARCHAR(20),
    MALOAINV INT NOT NULL,
    EMAIL VARCHAR(30),

    CONSTRAINT CHODUYETKH_MAKH PRIMARY KEY (MAKH),
    CONSTRAINT CHODUYETKH_MALOAINV FOREIGN KEY (MALOAINV) REFERENCES LOAINHANVIEN (MALOAINV)
);

CREATE TABLE KHACHHANG(
    MAKH INT AUTO_INCREMENT,
    TENKH NVARCHAR(50) NOT NULL,
    SDT VARCHAR(13) NOT NULL,
    DIACHI NVARCHAR(200) NOT NULL,
    MK VARCHAR(20),
    MALOAINV INT NOT NULL,
    EMAIL VARCHAR(30),

    CONSTRAINT KHACHHANG_MAKH PRIMARY KEY (MAKH),
    CONSTRAINT KHACHHANG_MALOAINV FOREIGN KEY (MALOAINV) REFERENCES LOAINHANVIEN (MALOAINV)
);


CREATE TABLE TRIETKHAU(
    MATK INT AUTO_INCREMENT,
    NGAY DATE,
    GIATRI FLOAT(2,2),

    CONSTRAINT TRIETKHAU_MATK PRIMARY KEY (MATK)
);

CREATE TABLE SANPHAM(
    MASP INT AUTO_INCREMENT,
    MACODE VARCHAR(10) NOT NULL,
    TENSP NVARCHAR(20),
    TRANGWEB VARCHAR(200),
    GIAWEB DECIMAL,
    KHOILUONG FLOAT(3,3),
    GHICHU TEXT,

    CONSTRAINT SANPHAM_MASP PRIMARY KEY (MASP)
);

CREATE TABLE DONHANG(
    MADH INT AUTO_INCREMENT,
    NGAY DATE,
    TIENYEN DECIMAL,
    TIGIA DECIMAL,
    TRANGTHAI INT NOT NULL,
    GHICHU TEXT,
    MAKH INT NOT NULL,

    CONSTRAINT DONHANG_MADH PRIMARY KEY (MADH),
    CONSTRAINT DONHANG_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG (MAKH)
);

CREATE TABLE CHITIETDH(
    MADH INT,
    MASP INT,
    SOLUONG INT,
    MACHECK INT,
    MAKH INT NOT NULL,

    CONSTRAINT CHITIETDH_MADH_MASP PRIMARY KEY (MADH, MASP),
    CONSTRAINT CHITIETDH_MADH FOREIGN KEY (MADH) REFERENCES DONHANG (MADH),
    CONSTRAINT CHITIETDH_MASP FOREIGN KEY (MASP) REFERENCES SANPHAM (MASP),
    CONSTRAINT CHITIETDH_MACHECK FOREIGN KEY (MACHECK) REFERENCES KHACHHANG (MAKH),
    CONSTRAINT CHITIETDH_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG (MAKH)
);

CREATE TABLE HOADON(
    MAHD INT AUTO_INCREMENT,
    NGAYGIAO DATE,
    MAKH INT NOT NULL,
    TRANGTHAI INT,
    DATCOC DECIMAL,
    MACHECK INT,

    CONSTRAINT HOADON_MAHD PRIMARY KEY (MAHD),
    CONSTRAINT HOADON_MAHK FOREIGN KEY (MAKH) REFERENCES KHACHHANG (MAKH),
    CONSTRAINT HOADON_MACHECK FOREIGN KEY (MACHECK) REFERENCES KHACHHANG (MAKH)
);

CREATE TABLE CHITIETHD(
    MAHD INT,
    MASP INT,
    SOLUONG INT,
    NGAYDAT DATE,
    TRANGTHAI INT,
    MADH INT,
    MACHECK INT,
    MAKH INT,

    CONSTRAINT CHITIETHD_MAHD_MASP PRIMARY KEY (MAHD, MASP),
    CONSTRAINT CHITIETHD_MAHD FOREIGN KEY (MAHD) REFERENCES HOADON (MAHD),
    CONSTRAINT CHITIETHD_MASP FOREIGN KEY (MASP) REFERENCES SANPHAM (MASP),
    CONSTRAINT CHITIETHD_MADH FOREIGN KEY (MADH) REFERENCES DONHANG (MADH),
    CONSTRAINT CHITIETHD_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG (MAKH),
    CONSTRAINT CHITIETHD_MACHECK FOREIGN KEY (MACHECK) REFERENCES KHACHHANG (MAKH)
);



INSERT INTO `LOAINHANVIEN` (`MALOAINV`, `TENLOAINV`) VALUES
(1, 'ADMIN'),
(2, 'KHACHHANG'),
(3, 'KHACHBUON'),
(4, 'NGUOIMUA'),
(5, 'SHIPPER');
INSERT INTO `KHACHHANG` (`MAKH`, `TENKH`, `SDT`, `DIACHI`, `MK`, `MALOAINV`, `EMAIL`) VALUES
(1, 'ADMIN', '1234', 'XUÂN TRƯỜNG - NAM ĐỊNH', 'NOPASS', 1, 'TRACHPRO'),
(2, 'KHACHHANG', '222', 'XÓM 2 - XUÂN DỤC - XUÂN NINH', 'NOPASS', 2, 'VÃI LÚA'),
(3, 'KHACHBUON', '333', 'XÓM 2 - XUÂN DỤC - XUÂN NINH', 'NOPASS', 3, 'VÃI LÚA'),
(4, 'NGUOIMUA', '444', 'XÓM 2 - XUÂN DỤC - XUÂN NINH', 'NOPASS', 4, 'VÃI LÚA'),
(5, 'SHIPPER', '555', 'XÓM 2 - XUÂN DỤC - XUÂN NINH', 'NOPASS', 5, 'VÃI LÚA');

INSERT INTO `TRIETKHAU` (`MATK`,`NGAY`,`GIATRI`) VALUES
(1, '2018-01-01',0.5);

INSERT INTO `SANPHAM` (`MASP`, `MACODE`, `TENSP`, `TRANGWEB`, `GIAWEB`,`KHOILUONG`,`GHICHU`) VALUES
(1, 'E00', 'DIENTHOAI', 'HTTP', 123,0,'SAN PHAM NAY RAT TUYET VOI'),
(2, 'E01', 'DEP', 'HTTPS', 123,0,'SAN PHAM NAY RAT TUYET VOIT'),
(3, 'E02', 'DAY', 'HTTPSS', 123,0,'SAN PHAM NAY RAT TUYET VOIG');

INSERT INTO `DONHANG` (`MADH`, `NGAY`, `TIENYEN`, `TIGIA`, `TRANGTHAI`, `GHICHU`, `MAKH`) VALUES
(1, '2018-01-01', '12', '12', 5, 'KHÔNG CÓ GHI CHÚ J', 4);

INSERT INTO `CHITIETDH` (`MADH`, `MASP`, `SOLUONG`,`MACHECK`,`MAKH`) VALUES
(1, 1, 2, 4, 2),
(1, 2, 44, 4, 2);

INSERT INTO `HOADON` (`MAHD`, `NGAYGIAO`, `MAKH`, `TRANGTHAI`, `DATCOC`,`MACHECK`) VALUES
(1, '2018-01-10', 2, 0, '12', 5);

INSERT INTO `CHITIETHD` (`MAHD`, `MASP`, `SOLUONG`, `NGAYDAT`, `TRANGTHAI`,`MACHECK`,`MADH`) VALUES
(1, 1, 2, '2018-01-02', 5, 5,1),
(1, 2, 4, '2018-01-05', 5, 5,1);