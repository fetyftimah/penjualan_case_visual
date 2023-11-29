unit User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, StdCtrls, ExtCtrls;

type
  TFormUser = class(TForm)
    shp1: TShape;
    lbl1: TLabel;
    Edtusername: TEdit;
    lbl2: TLabel;
    Edtpassword: TEdit;
    Edtnama: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    Edtalamat: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    Edtnohp: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bprint: TButton;
    bbatal: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dtp1: TDateTimePicker;
    procedure edtbersih;
    procedure edtenable;
    procedure posisiawal;
    procedure FormShow(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure bprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUser: TFormUser;
  id: string;

implementation

{$R *.dfm}

procedure TFormUser.edtbersih;
begin
Edtusername.Clear;
Edtpassword.Clear;
Edtnama.Clear;
Edtalamat.Clear;
Edtnohp.Clear;
end;

procedure TFormUser.edtenable;
begin
Edtusername.Enabled:= True;
Edtpassword.Enabled:= True;
Edtnama.Enabled:= True;
Edtalamat.Enabled:= True;
dtp1.Enabled:= True;
Edtnohp.Enabled:= True;
end;

procedure TFormUser.posisiawal;
begin
edtbersih;
Edtusername.Enabled:= False;
Edtpassword.Enabled:= False;
Edtnama.Enabled:= False;
Edtalamat.Enabled:= False;
dtp1.Enabled:= False;
Edtnohp.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;


end;

procedure TFormUser.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormUser.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormUser.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormUser.bsimpanClick(Sender: TObject);
begin
  if (Edtusername.Text='') or (Edtpassword.Text='') or (Edtnama.Text='') or (Edtalamat.Text='') or (Edtnohp.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tb_user values (null,"'+Edtusername.Text+'","'+Edtpassword.Text+'","'+Edtnama.Text+'","'+Edtalamat.Text+'","'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+Edtnohp.Text+'")');
  zqry1.ExecSQL;

  //ZQuery1.Active:= False;
  //ZQuery1.Active:= True;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tb_user');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormUser.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtusername.Text:= zqry1.FieldList[1].AsString;
Edtpassword.Text:= zqry1.FieldList[2].AsString;
Edtnama.Text:= zqry1.FieldList[3].AsString;
Edtalamat.Text:= zqry1.FieldList[4].AsString;
dtp1.Date:= StrToDate(zqry1.FieldList[5].AsString);
Edtnohp.Text:= zqry1.FieldList[6].AsString;
end;

procedure TFormUser.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tb_user where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormUser.beditClick(Sender: TObject);
begin
  if (Edtusername.Text='') or (Edtpassword.Text='') or (Edtnama.Text='') or (Edtalamat.Text='') or (Edtnohp.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (Edtusername.Text = zqry1.FieldList[1].AsString) and (Edtpassword.Text = zqry1.FieldList[2].AsString) and(Edtnama.Text = zqry1.FieldList[3].AsString) and (Edtalamat.Text = zqry1.FieldList[4].AsString) and (Edtnohp.Text = zqry1.FieldList[6].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tb_user set username="'+Edtusername.Text+'", pass="'+Edtpassword.Text+'", nama="'+Edtnama.Text+'", alamat="'+Edtalamat.Text+'", tgl_bergabung="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'",  no_hp="'+Edtnohp.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tb_user');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormUser.bprintClick(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

end.
