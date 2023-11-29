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
    procedure USER1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

uses User;

{$R *.dfm}

procedure TFormMenu.USER1Click(Sender: TObject);
begin
FormUser.ShowModal;
end;

end.
