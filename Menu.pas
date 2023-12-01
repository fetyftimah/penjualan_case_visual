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
    procedure USER1Click(Sender: TObject);
    procedure SUPPLIER1Click(Sender: TObject);
    procedure Kustomer1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

uses User, Supplier, Kustomer;

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

end.
