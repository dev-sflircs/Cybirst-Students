# Cybirst 

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

### Installation

#### Bước 1: Download hoặc Clone project
```sh
$ git clone git@github.com:khanh96le/QuanLyThuVien.git
```
#### Bước 2: Mở project bằng Visual studio 2015

#### Bước 3: Mở file **Web.config** thay đổi Data Source trong phần **connectionString**
```sh
  <connectionStrings>
    <add name="LibraryContext" connectionString="Data Source=<YOUR_SQL_SERVER>;Initial Catalog=QuanLyThuVien;Integrated Security=SSPI;" providerName="System.Data.SqlClient" />
  </connectionStrings>
```

#### Bước 4: Import cơ sở dữ liệu vào SQL Server

Mở và chạy file **script.sql** bằng SQL Server

#### Bước 5: Chạy project