unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ExtCtrls;

type
  TFormMenu = class(TForm)
    shp1: TShape;
    mm1: TMainMenu;
    AKUN1: TMenuItem;
    USER1: TMenuItem;
    SUPPLIER1: TMenuItem;
    Kustomer1: TMenuItem;
    PENDATAAN1: TMenuItem;
    BARANG1: TMenuItem;
    STOK1: TMenuItem;
    PEMBELIAN1: TMenuItem;
    PENJUALAN1: TMenuItem;
    DETAILJUAL1: TMenuItem;
    procedure USER1Click(Sender: TObject);
    procedure SUPPLIER1Click(Sender: TObject);
    procedure Kustomer1Click(Sender: TObject);
    procedure BARANG1Click(Sender: TObject);
    procedure STOK1Click(Sender: TObject);
    procedure PEMBELIAN1Click(Sender: TObject);
    procedure PENJUALAN1Click(Sender: TObject);
    procedure DETAILJUAL1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

uses User, Supplier, Kustomer, Barang, Stok, Pembelian, Penjualan, DetailJual;

{$R *.dfm}

procedure TFormMenu.USER1Click(Sender: TObject);
begin
FormUser.ShowModal;
end;

procedure TFormMenu.SUPPLIER1Click(Sender: TObject);
begin
FormSupplier.ShowModal;
end;

procedure TFormMenu.Kustomer1Click(Sender: TObject);
begin
FormKustomer.ShowModal;
end;

procedure TFormMenu.BARANG1Click(Sender: TObject);
begin
FormBarang.ShowModal;
end;

procedure TFormMenu.STOK1Click(Sender: TObject);
begin
FormStok.ShowModal;
end;

procedure TFormMenu.PEMBELIAN1Click(Sender: TObject);
begin
FormPembelian.ShowModal;
end;

procedure TFormMenu.PENJUALAN1Click(Sender: TObject);
begin
FormPenjualan.ShowModal;
end;

procedure TFormMenu.DETAILJUAL1Click(Sender: TObject);
begin
FormDetailJual.ShowModal;
end;

end.
