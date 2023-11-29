program PenjualanCase;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormLogin},
  Menu in 'Menu.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
