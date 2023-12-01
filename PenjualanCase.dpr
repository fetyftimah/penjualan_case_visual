program PenjualanCase;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormLogin},
  Menu in 'Menu.pas' {FormMenu},
  User in 'User.pas' {FormUser},
  Supplier in 'Supplier.pas' {FormSupplier},
  Kustomer in 'Kustomer.pas' {FormKustomer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormSupplier, FormSupplier);
  Application.CreateForm(TFormKustomer, FormKustomer);
  Application.Run;
end.
