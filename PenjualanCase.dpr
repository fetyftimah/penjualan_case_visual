program PenjualanCase;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormLogin},
  Menu in 'Menu.pas' {FormMenu},
  User in 'User.pas' {FormUser},
  Supplier in 'Supplier.pas' {FormSupplier},
  Kustomer in 'Kustomer.pas' {FormKustomer},
  Barang in 'Barang.pas' {FormBarang},
  Stok in 'Stok.pas' {FormStok},
  Pembelian in 'Pembelian.pas' {FormPembelian},
  Penjualan in 'Penjualan.pas' {FormPenjualan},
  DetailJual in 'DetailJual.pas' {FormDetailJual},
  DetailBeli in 'DetailBeli.pas' {FormDetailBeli},
  Return in 'Return.pas' {FormReturn};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormSupplier, FormSupplier);
  Application.CreateForm(TFormKustomer, FormKustomer);
  Application.CreateForm(TFormBarang, FormBarang);
  Application.CreateForm(TFormStok, FormStok);
  Application.CreateForm(TFormPembelian, FormPembelian);
  Application.CreateForm(TFormPenjualan, FormPenjualan);
  Application.CreateForm(TFormDetailJual, FormDetailJual);
  Application.CreateForm(TFormDetailBeli, FormDetailBeli);
  Application.CreateForm(TFormReturn, FormReturn);
  Application.Run;
end.
