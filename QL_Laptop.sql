Create Database QL_Laptop
go
use QL_Laptop
CREATE TABLE Employee --Bảng Nhân Viên
(

ID varchar(10) PRIMARY KEY, --Mã nhân viên
FullName nvarchar(100),  -- Họ tên 
birthday DATE CHECK (YEAR(birthday) > 18),  -- Ngày sinh 
Position NVARCHAR(50) NOT NULL, -- Vị trí
Gender nvarchar(10) CHECK (Gender IN ('Male','Female')), -- Giới tính 
Phone varchar(10) UNIQUE CHECK (Phone LIKE '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), -- Sđt
Email varchar(50) UNIQUE ,
Address nvarchar(100) -- Địa chỉ
)


CREATE TABLE Shift --Bảng ca làm
(
ID VARCHAR(10) PRIMARY KEY,
Session nvarchar(20), -- Ca
Day DATE
)

CREATE TABLE Employee_Shift
(
IDEmployee VARCHAR(10) FOREIGN KEY REFERENCES dbo.Employee(ID),
IDShift VARCHAR(10) FOREIGN KEY REFERENCES dbo.Shift(ID), 
)

CREATE TABLE Customer --Bảng khách hàng
(

ID varchar(10) PRIMARY KEY,
Name nvarchar(100),
Address nvarchar(100),
PhoneNumber varchar(10) UNIQUE CHECK (PhoneNumber LIKE '[0][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)


CREATE TABLE Laptop --Bảng laptop
(

ID varchar(10) PRIMARY KEY, -- Mã laptop
Name varchar(50), --Tên laptop
Brand varchar(10), -- Hãng
UnitPrice FLOAT -- Đơn giá
)

CREATE TABLE Config --Bảng cấu hình
(

IDLaptop varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Laptop(ID),
CPU varchar(50),
RAM varchar(50),
HardDisk varchar(50), 
VGA varchar(50),
ScreenSize FLOAT, --Kich thước màn hình
ScreenResolution varchar(20), -- Độ phân giải màn hình
)


CREATE TABLE Advisory --Bảng tư vấn
(

IDEmployee varchar(10) FOREIGN KEY REFERENCES dbo.Employee(ID),  
IDCustomer varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Customer(ID)
)
CREATE TABLE Bill --Bảng hóa đơn
(

ID varchar(10) PRIMARY KEY,
TotalMoney FLOAT, -- Tổng tiền
IDEmployee varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Employee(ID), -- Mã nhân viên	
IDCustomer varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Customer (ID), -- Mã khách hàng
DateOfBill DATE --Ngày lập bill
)
CREATE TABLE BillDetail -- Bảng chi tiết hóa đơn
(

IDBill varchar(10) FOREIGN KEY REFERENCES dbo.Bill(ID),
IDLaptop varchar(10) NOT NULL FOREIGN KEY REFERENCES dbo.Laptop(ID),
Amount INT, -- Số lượng
Into_money FLOAT -- Thành tiền
)

CREATE TABLE Login
(
sno INT PRIMARY KEY,
UserName varchar(15),
Password varchar(15)
)

INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV01' , -- ID - varchar(10)
          N'Đỗ Hoàng Gia' , -- FullName - nvarchar(100)
          '2000-09-11' , -- birthday - date
          N'Tư vấn' , -- Position - nvarchar(50)
          N'Male' , -- Gender - nvarchar(10)
          '0978806136' , -- Phone - varchar(10)
          'giadohoang2000@gmail.com' , -- Mail - varchar(50)
          N'450 Lê Văn Việt, Q9, HCM'  -- Address - nvarchar(100)
        )
INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV02' , -- ID - varchar(10)
          N'Trần Tiến Đạt' , -- FullName - nvarchar(100)
          '2000-02-08' , -- birthday - date
          N'Tư vấn' , -- Position - nvarchar(50)
          N'Male' , -- Gender - nvarchar(10)
          '0123456789' , -- Phone - varchar(10)
          'dattran2000@gmail.com' , -- Mail - varchar(50)
          N' BT, HCM'  -- Address - nvarchar(100)
        )
INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV03' , -- ID - varchar(10)
          N'Đinh Hữu Thanh Nguyên ' , -- FullName - nvarchar(100)
          '2000-10-08' , -- birthday - date
          N'Kế toán' , -- Position - nvarchar(50)
          N'Male' , -- Gender - nvarchar(10)
          '0377407930' , -- Phone - varchar(10)
          'nguyen2000@gmail.com' , -- Mail - varchar(50)
          N'TĐ, HCM'  -- Address - nvarchar(100)
        )
INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV04' , -- ID - varchar(10)
          N'Trần Phương Ly' , -- FullName - nvarchar(100)
          '1990-06-05' , -- birthday - date
          N'Tư vấn' , -- Position - nvarchar(50)
          N'Female' , -- Gender - nvarchar(10)
          '0346686888' , -- Phone - varchar(10)
          'lytran_1990@gmail.com' , -- Email - varchar(50)
          N'TPHCM'  -- Address - nvarchar(100)
        )
INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV05' , -- ID - varchar(10)
          N'Lung Thị Linh' , -- FullName - nvarchar(100)
          '1995-03-07' , -- birthday - date
          N'Tư vấn' , -- Position - nvarchar(50)
          N'Female' , -- Gender - nvarchar(10)
          '0336686888' , -- Phone - varchar(10)
          'lungling_95@gmail.com' , -- Email - varchar(50)
          N'TPHCM'  -- Address - nvarchar(100)
        )
INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV06' , -- ID - varchar(10)
          N'Trần Đức Việt' , -- FullName - nvarchar(100)
          '1993-11-05' , -- birthday - date
          N'Kế toán' , -- Position - nvarchar(50)
          N'Male' , -- Gender - nvarchar(10)
          '0356686888' , -- Phone - varchar(10)
          'viettran_93@gmail.com' , -- Email - varchar(50)
          N'TPHCM'  -- Address - nvarchar(100)
        )
INSERT INTO dbo.Employee
        ( ID ,
          FullName ,
          birthday ,
          Position ,
          Gender ,
          Phone ,
          Email ,
          Address
        )
VALUES  ( 'NV07' , -- ID - varchar(10)
          N'Trần Đức Nam' , -- FullName - nvarchar(100)
          '1992-06-05' , -- birthday - date
          N'Kế toán' , -- Position - nvarchar(50)
          N'Male' , -- Gender - nvarchar(10)
          '0366686888' , -- Phone - varchar(10)
          'trannam_92@gmail.com' , -- Email - varchar(50)
          N'TPHCM'  -- Address - nvarchar(100)
        )

INSERT INTO dbo.Shift
        ( ID, Session, Day )
VALUES  ( 'Ca01', -- ID - varchar(10)
          N'Sáng', -- Session - nvarchar(20)
          '2020-06-23'  -- Day - date
          )
INSERT INTO dbo.Shift
        ( ID, Session, Day )
VALUES  ( 'Ca02', -- ID - varchar(10)
          N'Chiều', -- Session - nvarchar(20)
          '2020-06-23'  -- Day - date
          )
INSERT INTO dbo.Shift
        ( ID, Session, Day )
VALUES  ( 'Ca03', -- ID - varchar(10)
          N'Tối', -- Session - nvarchar(20)
          '2020-06-23'  -- Day - date
          )
INSERT INTO dbo.Shift
        ( ID, Session, Day )
VALUES  ( 'Ca04', -- ID - varchar(10)
          N'Sáng', -- Session - nvarchar(20)
          '2020-06-24'  -- Day - date
          )
INSERT INTO dbo.Shift
        ( ID, Session, Day )
VALUES  ( 'Ca05', -- ID - varchar(10)
          N'Chiều', -- Session - nvarchar(20)
          '2020-06-24'  -- Day - date
          )
INSERT INTO dbo.Shift
        ( ID, Session, Day )
VALUES  ( 'Ca06', -- ID - varchar(10)
          N'Tối', -- Session - nvarchar(20)
          '2020-06-24'  -- Day - date
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV01', -- IDEmployee - varchar(10)
          'Ca01'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV02', -- IDEmployee - varchar(10)
          'Ca02'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'Ca03'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV04', -- IDEmployee - varchar(10)
          'Ca01'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV05', -- IDEmployee - varchar(10)
          'Ca02'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'Ca03'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV07', -- IDEmployee - varchar(10)
          'Ca03'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV01', -- IDEmployee - varchar(10)
          'Ca06'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV02', -- IDEmployee - varchar(10)
          'Ca05'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'Ca04'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV04', -- IDEmployee - varchar(10)
          'Ca06'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV05', -- IDEmployee - varchar(10)
          'Ca05'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'Ca04'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Employee_Shift
        ( IDEmployee, IDShift )
VALUES  ( 'NV07', -- IDEmployee - varchar(10)
          'Ca06'  -- IDShift - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH01' , -- ID - varchar(10)
          N'Trần Đức Bo' , -- Name - nvarchar(100)
          
          N'HCM' , -- Address - nvarchar(100)
          '0979797979'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,
           
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH02' , -- ID - varchar(10)
          N'Trần Dần' , -- Name - nvarchar(100)
          
          N'Phao Sần Pờ Lây' , -- Address - nvarchar(100)
          '0886868686'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,    
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH03' , -- ID - varchar(10)
          N'Ricardo Milos' , -- Name - nvarchar(100)
          N'USA' , -- Address - nvarchar(100)
          '0939393939'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,
          
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH04' , -- ID - varchar(10)
          N'Kenny You' , -- Name - nvarchar(100)
          
          N'Tây Ninh' , -- Address - nvarchar(100)
          '0339779699'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,
           
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH05' , -- ID - varchar(10)
          N'Phúc Rey' , -- Name - nvarchar(100)
          
          N'Long An' , -- Address - nvarchar(100)
          '0389945565'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,
           
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH06' , -- ID - varchar(10)
          N'Bùi Xuân Huấn' , -- Name - nvarchar(100)
          
          N'Yên Bái' , -- Address - nvarchar(100)
          '0868888888'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID ,
          Name ,
           
          Address ,
          PhoneNumber
        )
VALUES  ( 'KH07' , -- ID - varchar(10)
          N'Ngô Bá Khá' , -- Name - nvarchar(100)
          
          N'Bắc Ninh' , -- Address - nvarchar(100)
          '0886868689'  -- PhoneNumber - varchar(10)
        )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH08', -- ID - varchar(10)
          N'Võ Minh Hiếu', -- Name - nvarchar(100)
          N'Cai Lậy', -- Address - nvarchar(100)
          '0369457899'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH09', -- ID - varchar(10)
          N'Phan Kim Tiền', -- Name - nvarchar(100)
          N'Long Xuyên', -- Address - nvarchar(100)
          '0858787898'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH10', -- ID - varchar(10)
          N'Linda Cẩm Lan', -- Name - nvarchar(100)
          N'Phố Đi Bộ ', -- Address - nvarchar(100)
          '0877567768'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH11', -- ID - varchar(10)
          N'Long Nhật', -- Name - nvarchar(100)
          N'HCM', -- Address - nvarchar(100)
          '0357466488'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH12', -- ID - varchar(10)
          N'Lê Minh Long', -- Name - nvarchar(100)
          N'Vũng Tàu', -- Address - nvarchar(100)
          '0389444888'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH13', -- ID - varchar(10)
          N'Lê Anh Quân', -- Name - nvarchar(100)
          N'HCM', -- Address - nvarchar(100)
          '0878777788'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH14', -- ID - varchar(10)
          N'Dương Minh Tuyền', -- Name - nvarchar(100)
          N'Bắc Ninh', -- Address - nvarchar(100)
          '0779979977'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH15', -- ID - varchar(10)
          N'Bùi Hữu Nghĩa', -- Name - nvarchar(100)
          N'Hà Nội', -- Address - nvarchar(100)
          '0373393993'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH16', -- ID - varchar(10)
          N'Nguyễn Vũ Sơn', -- Name - nvarchar(100)
          N'HCM', -- Address - nvarchar(100)
          '0855897858'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH17', -- ID - varchar(10)
          N'Trần Thanh Thiên Bảo', -- Name - nvarchar(100)
          N'HCM', -- Address - nvarchar(100)
          '0994594999'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH18', -- ID - varchar(10)
          N'Lê Đức', -- Name - nvarchar(100)
          N'Hà Nội', -- Address - nvarchar(100)
          '0554584788'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH19', -- ID - varchar(10)
          N'Vũ Đức Thiện', -- Name - nvarchar(100)
          N'Hà Nội', -- Address - nvarchar(100)
          '0973564433'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH20', -- ID - varchar(10)
          N'Bùi Bích Phương', -- Name - nvarchar(100)
          N'Quảng Ninh', -- Address - nvarchar(100)
          '0898541033'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH21', -- ID - varchar(10)
          N'Nguyễn Đức Cường', -- Name - nvarchar(100)
          N'Quảng Ninh', -- Address - nvarchar(100)
          '0987456321'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH22', -- ID - varchar(10)
          N'Lê Trung Thành', -- Name - nvarchar(100)
          N'HCM', -- Address - nvarchar(100)
          '0961567893'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH23', -- ID - varchar(10)
          N'Nguyễn Trần Trung Đan', -- Name - nvarchar(100)
          N'Gia Lai', -- Address - nvarchar(100)
          '0915648979'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Customer
        ( ID, Name, Address, PhoneNumber )
VALUES  ( 'KH24', -- ID - varchar(10)
          N'Tô Ngọc Bảo Linh', -- Name - nvarchar(100)
          N'HCM', -- Address - nvarchar(100)
          '0973159789'  -- PhoneNumber - varchar(10)
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap01', -- ID - varchar(10)
          'Asus XA509-xt1813', -- Name - varchar(50)
          'Asus', -- Brand - varchar(10)
          14500000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap02', -- ID - varchar(10)
          'Dell Inspiron 5593 N5I5513W ', -- Name - varchar(50)
          'Dell', -- Brand - varchar(10)
          17990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap03', -- ID - varchar(10)
          'Macbook Air 2020 ZOYL', -- Name - varchar(50)
          'Apple', -- Brand - varchar(10)
          30990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap04', -- ID - varchar(10)
          'HP Envy 13 aq1022TU', -- Name - varchar(50)
          'HP', -- Brand - varchar(10)
          226900000 -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap05', -- ID - varchar(10)
          'Acer Swift 3 NX.GZBSV.002', -- Name - varchar(50)
          'Acer', -- Brand - varchar(10)
          16990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap06', -- ID - varchar(10)
          'Dell Vostro 3580 O75F010V80I', -- Name - varchar(50)
          'Dell', -- Brand - varchar(10)
          14690000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap07', -- ID - varchar(10)
          'HP 348 G7 9PH06PA', -- Name - varchar(50)
          'HP', -- Brand - varchar(10)
          16290000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap08', -- ID - varchar(10)
          'Asus VivoBook S14 S431 EB131T', -- Name - varchar(50)
          'Asus', -- Brand - varchar(10)
          21990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap09', -- ID - varchar(10)
          'Asus Gaming ROG Strix G531G AL017T', -- Name - varchar(50)
          'Asus', -- Brand - varchar(10)
          27990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap10', -- ID - varchar(10)
          'MacBook Pro 13 2020 256GB', -- Name - varchar(50)
          'Apple', -- Brand - varchar(10)
          34990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap11', -- ID - varchar(10)
          'MacBook Pro 13 TouchBar 2019 256GB', -- Name - varchar(50)
          'Apple', -- Brand - varchar(10)
          44490000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap12', -- ID - varchar(10)
          'MSI Bravo 15 A4DCR-070VN', -- Name - varchar(50)
          'MSI', -- Brand - varchar(10)
          20990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap13', -- ID - varchar(10)
          'MSI Modern 14 A10', -- Name - varchar(50)
          'MSI', -- Brand - varchar(10)
          18490000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap14', -- ID - varchar(10)
          'Asus TUF FA506II-AL012T', -- Name - varchar(50)
          'Asus', -- Brand - varchar(10)
          21990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap15', -- ID - varchar(10)
          'Asus Zenbook UX334FAC-4059T', -- Name - varchar(50)
          'Asus', -- Brand - varchar(10)
          23990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap16', -- ID - varchar(10)
          'Dell XPS13 7390 i7', -- Name - varchar(50)
          'Dell', -- Brand - varchar(10)
          54990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap17', -- ID - varchar(10)
          'HP Pavilion 15-cs3116TX', -- Name - varchar(50)
          'HP', -- Brand - varchar(10)
          16590000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap18', -- ID - varchar(10)
          'HP Pavilion 14-ce3026TU', -- Name - varchar(50)
          'HP', -- Brand - varchar(10)
          16990000  -- UnitPrice - float
          )
INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap19', -- ID - varchar(10)
          'Lenovo Thinkpad E590', -- Name - varchar(50)
          'Lenovo', -- Brand - varchar(10)
          19990000  -- UnitPrice - float
          )

INSERT INTO dbo.Laptop
        ( ID, Name, Brand, UnitPrice )
VALUES  ( 'Lap20', -- ID - varchar(10)
          'Lenovo Legion 5-15ARH05', -- Name - varchar(50)
          'Lenovo', -- Brand - varchar(10)
          24990000  -- UnitPrice - float
          )
INSERT INTO dbo.Config
        ( 
          CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 
          'Core i5 8250u' , -- CPU - varchar(50)
          '4GB DDR4 2400MHz' , -- RAM - varchar(50)
          '256 GB SSD' , -- HardDisk - varchar(50)
          'UHD 620' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap01'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 10210U' , -- CPU - varchar(50)
          '8GB DDR4 2666MHz' , -- RAM - varchar(50)
          '256 GB SSD' , -- HardDisk - varchar(50)
          'UHD 620' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap02'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 10th 1.1GHz' , -- CPU - varchar(50)
          '8GB LPDDR4X 3733MHz' , -- RAM - varchar(50)
          '256 GB SSD' , -- HardDisk - varchar(50)
          'Intel Iris Plus Graphics' , -- VGA - varchar(50)
          13.3 , -- ScreenSize - float
          '2560*1600' , -- ScreenResolution - varchar(20)
          'Lap03'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 10210U' , -- CPU - varchar(50)
          '8GB DDR4 2400MHz' , -- RAM - varchar(50)
          '512 GB SSD' , -- HardDisk - varchar(50)
          'UHD 620' , -- VGA - varchar(50)
          13.0 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap04'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 8250U' , -- CPU - varchar(50)
          '8GB DDR4 2400MHz' , -- RAM - varchar(50)
          '256 GB SSD' , -- HardDisk - varchar(50)
          'UHD 620' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap05'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 8265U' , -- CPU - varchar(50)
          '8GB DDR4 2400MHz' , -- RAM - varchar(50)
          '1 TB HDD' , -- HardDisk - varchar(50)
          'AMD Radeon 520 2GB GDDR5' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap06'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 10210U' , -- CPU - varchar(50)
          '8GB DDR4 2400MHz' , -- RAM - varchar(50)
          '512 GB SSD' , -- HardDisk - varchar(50)
          'UHD 620' , -- VGA - varchar(50)
          14.0 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap07'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i7 8565U' , -- CPU - varchar(50)
          '8GB LPDDR3 2133MHz' , -- RAM - varchar(50)
          '512 GB SSD and Intel Optane 32GB' , -- HardDisk - varchar(50)
          'UHD 620' , -- VGA - varchar(50)
          14.0 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap08'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i7 9750H' , -- CPU - varchar(50)
          '8Gb DDR4 2666Mhz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'Gtx 1650 4gb GDDR5' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap09'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 1.4GHz' , -- CPU - varchar(50)
          '8Gb DDR4 2133MHz' , -- RAM - varchar(50)
          '256Gb SSD' , -- HardDisk - varchar(50)
          'Intel Iris Plus Graphic 645' , -- VGA - varchar(50)
          13.3 , -- ScreenSize - float
          '2560*1600' , -- ScreenResolution - varchar(20)
          'Lap10'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 2.4GHz' , -- CPU - varchar(50)
          '8Gb DDR4 2133MHz' , -- RAM - varchar(50)
          '256Gb SSD' , -- HardDisk - varchar(50)
          'Intel Iris Plus Graphic 655' , -- VGA - varchar(50)
          13.3 , -- ScreenSize - float
          '2560*1600' , -- ScreenResolution - varchar(20)
          'Lap11'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Ryzen 4600H' , -- CPU - varchar(50)
          '8Gb DDR4 3200MHz' , -- RAM - varchar(50)
          '256Gb SSD' , -- HardDisk - varchar(50)
          'Radeon RX 5300M 3Gb GDDR6' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap12'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 10210U' , -- CPU - varchar(50)
          '8Gb DDR4 2666MHz' , -- RAM - varchar(50)
          '256Gb SSD' , -- HardDisk - varchar(50)
          'Intel UHD 620' , -- VGA - varchar(50)
          14.0 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap13'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Ryzen 5 4600H' , -- CPU - varchar(50)
          '8Gb DDR4 3200MHz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'GTX 1650Ti 4Gb GDDR5' , -- VGA - varchar(50)
          13.3 , -- ScreenSize - float
          '2560*1600' , -- ScreenResolution - varchar(20)
          'Lap14'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 10210U' , -- CPU - varchar(50)
          '8Gb LPDDR3 2133MHz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'Intel Iris Plus Graphic 645' , -- VGA - varchar(50)
          13.3 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap15'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i7 1.8GHz' , -- CPU - varchar(50)
          '16Gb DDR4 2133MHz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'Intel Iris Plus Graphic 645' , -- VGA - varchar(50)
          13.3 , -- ScreenSize - float
          '3840*2160' , -- ScreenResolution - varchar(20)
          'Lap16'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 1035G1' , -- CPU - varchar(50)
          '4Gb DDR4 2666MHz' , -- RAM - varchar(50)
          '256Gb SSD' , -- HardDisk - varchar(50)
          'GeForce MX 250 2Gb GDDR5' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap17'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 1035G1' , -- CPU - varchar(50)
          '8Gb DDR4 2666MHz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'Intel UHD 620' , -- VGA - varchar(50)
          14.0 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap18'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Core i5 8265U' , -- CPU - varchar(50)
          '8Gb DDR4 2400MHz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'RX 550X 2GB GDDR5' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap19'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Config
        ( CPU ,
          RAM ,
          HardDisk ,
          VGA ,
          ScreenSize ,
          ScreenResolution ,
          IDLaptop
        )
VALUES  ( 'Ryzen 7 4800H' , -- CPU - varchar(50)
          '8Gb DDR4 3200MHz' , -- RAM - varchar(50)
          '512Gb SSD' , -- HardDisk - varchar(50)
          'GTX 1650 4GB GDDR6' , -- VGA - varchar(50)
          15.6 , -- ScreenSize - float
          '1920*1080' , -- ScreenResolution - varchar(20)
          'Lap20'  -- IDLaptop - varchar(10)
        )
INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill 
        )
VALUES  ( 'B01' , -- ID - varchar(10)
          17990000 , -- TotalMoney - float
          'NV01' , -- IDEmployee - varchar(10)
          'KH01' , -- IDCustomer - varchar(10)
		  '2020-06-23'  -- DateOfBill - date
        )
INSERT INTO dbo.BillDetail
        ( IDBill ,
          IDLaptop ,
          Amount ,
          Into_money
        )
VALUES  ( 'B01' , -- IDBill - varchar(10)          
          'Lap02' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
          17990000  -- Into_money - float
        )
INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B02' , -- ID - varchar(10)
          58000000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH02',  -- IDCustomer - varchar(10)
		   '2020-06-24'  -- DateOfBill - date
        )
INSERT INTO dbo.BillDetail
        ( IDBill ,
          IDLaptop ,
          Amount ,
          Into_money
        )
VALUES  ( 'B02' , -- IDBill - varchar(10)
         
          'Lap01' , -- IDLaptop - varchar(10)
          2 , -- Amount - int
          29000000  -- Into_money - float
        )

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B03' , -- ID - varchar(10)
          179900000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH03' , -- IDCustomer - varchar(10)
		  '2020-06-24' -- DateOfBill - date
        )

INSERT INTO dbo.BillDetail
        ( IDBill ,           
          IDLaptop ,
          Amount ,
          Into_money
        )
VALUES  ( 'B03' , -- IDBill - varchar(10)         
          'Lap02' , -- IDLaptop - varchar(10)
          10 , -- Amount - int
          179900000  -- Into_money - float
        )

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B04' , -- ID - varchar(10)
          92970000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH04' , -- IDCustomer - varchar(10)
		  '2020-06-24' -- DateOfBill - date
        )

INSERT INTO dbo.BillDetail
        ( IDBill ,          
          IDLaptop ,
          Amount ,
          Into_money
        )
VALUES  ( 'B04' , -- IDBill - varchar(10)          
          'Lap03' , -- IDLaptop - varchar(10)
          3 , -- Amount - int
          92970000  -- Into_money - float
        )

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B05' , -- ID - varchar(10)
          80350000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH05',  -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )
INSERT INTO dbo.BillDetail
        ( IDBill ,
          IDLaptop ,
          Amount ,
          Into_money
        )
VALUES  ( 'B05' , -- IDBill - varchar(10)         
          'Lap05',  -- IDLaptop - varchar(10)
          3 , -- Amount - int
          50970000  -- Into_money - float
        )
INSERT INTO dbo.BillDetail
        ( IDBill ,        
          IDLaptop ,
          Amount ,
          Into_money
        )
VALUES  ( 'B05' , -- IDBill - varchar(10)
          'Lap06' , -- IDLaptop - varchar(10)
          2 , -- Amount - int
          29380000-- Into_money - float
		)
INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B06' , -- ID - varchar(10)
          29380000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH06' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		   
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B06' , -- IDBill - varchar(10)          
          'Lap06' , -- IDLaptop - varchar(10)
          2 , -- Amount - int
           29380000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B07' , -- ID - varchar(10)
          32580000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH07' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		   
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B07' , -- IDBill - varchar(10)         
          'Lap07' , -- IDLaptop - varchar(10)
          2 , -- Amount - int
           32580000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill
        )
VALUES  ( 'B08' , -- ID - varchar(10)
          285870000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH08' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		   
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B08' , -- IDBill - varchar(10)          
          'Lap08' , -- IDLaptop - varchar(10)
          13 , -- Amount - int
           285870000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill 
        )
VALUES  ( 'B09' , -- ID - varchar(10)
          111960000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH09' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,
		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B09' , -- IDBill - varchar(10)         
          'Lap09' , -- IDLaptop - varchar(10)
          4 , -- Amount - int
           111960000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill 
        )
VALUES  ( 'B10' , -- ID - varchar(10)
          209940000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH10' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B10' , -- IDBill - varchar(10)          
          'Lap10' , -- IDLaptop - varchar(10)
          6 , -- Amount - int
           209940000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill 
        )
VALUES  ( 'B11' , -- ID - varchar(10)
          44490000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH11' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B11' , -- IDBill - varchar(10)          
          'Lap11' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           44490000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B12' , -- ID - varchar(10)
          20990000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH12' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B12' , -- IDBill - varchar(10)         
          'Lap12' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           20990000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B13' , -- ID - varchar(10)
          18490000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH13' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B13' , -- IDBill - varchar(10)          
          'Lap13' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           18490000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer,
		  DateOfBill 
        )
VALUES  ( 'B14' , -- ID - varchar(10)
          43980000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH14' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B14' , -- IDBill - varchar(10)          
          'Lap14' , -- IDLaptop - varchar(10)
          2 , -- Amount - int
           43980000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B15' , -- ID - varchar(10)
          23990000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH15' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B15' , -- IDBill - varchar(10)          
          'Lap15' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           23990000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B16' , -- ID - varchar(10)
          54990000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH16' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B16' , -- IDBill - varchar(10)          
          'Lap16' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           54990000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B17' , -- ID - varchar(10)
          16590000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH17' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B17' , -- IDBill - varchar(10)          
          'Lap17' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           16590000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B18' , -- ID - varchar(10)
          16990000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH18' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B18' , -- IDBill - varchar(10)          
          'Lap18' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           16990000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B19' , -- ID - varchar(10)
          19990000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH19' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B19' , -- IDBill - varchar(10)         
          'Lap19' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           19990000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B20' , -- ID - varchar(10)
          24990000 , -- TotalMoney - float
          'NV07' , -- IDEmployee - varchar(10)
          'KH20' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B20' , -- IDBill - varchar(10)          
          'Lap20' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           24990000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B21' , -- ID - varchar(10)
          18490000 , -- TotalMoney - float
          'NV03' , -- IDEmployee - varchar(10)
          'KH21' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B21' , -- IDBill - varchar(10)         
          'Lap13' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           18490000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B22' , -- ID - varchar(10)
          18490000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH22' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B22' , -- IDBill - varchar(10)         
          'Lap08' , -- IDLaptop - varchar(10)
          1 , -- Amount - int
           18490000-- Into_money - float 
		)


INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B23' , -- ID - varchar(10)
          222450000, -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH23' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B23' , -- IDBill - varchar(10)         
          'Lap11' , -- IDLaptop - varchar(10)
          5 , -- Amount - int
           222450000-- Into_money - float 
		)

INSERT INTO dbo.Bill
        ( ID ,
          TotalMoney ,
          IDEmployee ,
          IDCustomer ,
		  DateOfBill 
        )
VALUES  ( 'B24' , -- ID - varchar(10)
          314910000 , -- TotalMoney - float
          'NV06' , -- IDEmployee - varchar(10)
          'KH24' , -- IDCustomer - varchar(10)
		  '2020-06-24'  -- DateOfBill - date
        )

 INSERT INTO dbo.BillDetail
		( IDBill ,		  
		  IDLaptop ,
		  Amount ,
		  Into_money
		)
VALUES  ( 'B24' , -- IDBill - varchar(10)         
          'Lap10' , -- IDLaptop - varchar(10)
          9 , -- Amount - int
           314910000-- Into_money - float 
		)
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH01'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH02'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( NULL, -- IDEmployee - varchar(10)
          'KH03'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH04'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH05'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH06'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH07'  -- IDCustomer - varchar(10)
          )
INSERT INTO	dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH08'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV07', -- IDEmployee - varchar(10)
          'KH09'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH10'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH11'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( NULL, -- IDEmployee - varchar(10)
          'KH12'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH13'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV07', -- IDEmployee - varchar(10)
          'KH14'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( NULL, -- IDEmployee - varchar(10)
          'KH15'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH16'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH17'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV07', -- IDEmployee - varchar(10)
          'KH18'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( NULL, -- IDEmployee - varchar(10)
          'KH19'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( NULL, -- IDEmployee - varchar(10)
          'KH20'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV07', -- IDEmployee - varchar(10)
          'KH21'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV03', -- IDEmployee - varchar(10)
          'KH22'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( NULL, -- IDEmployee - varchar(10)
          'KH23'  -- IDCustomer - varchar(10)
          )
INSERT INTO dbo.Advisory
        ( IDEmployee, IDCustomer )
VALUES  ( 'NV06', -- IDEmployee - varchar(10)
          'KH24'  -- IDCustomer - varchar(10)
          )

SELECT * FROM dbo.Customer
SELECT * FROM dbo.Laptop
INSERT INTO dbo.Login
        ( sno, UserName, Password )
VALUES  ( 2, -- sno - int
          'ad', -- UserName - varchar(15)
          '1'  -- Password - varchar(15)
          )
