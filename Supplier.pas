unit Supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls,
  ExtCtrls;

type
  TFormSupplier = class(TForm)
    shp1: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    Edtnama: TEdit;
    Edtalamat: TEdit;
    Edtkota: TEdit;
    Edtnohp: TEdit;
    Edtperusahaan: TEdit;
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
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
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
  FormSupplier: TFormSupplier;
  id: string;

implementation

{$R *.dfm}

procedure TFormSupplier.edtbersih;
begin
Edtnama.Clear;
Edtalamat.Clear;
Edtkota.Clear;
Edtnohp.Clear;
Edtperusahaan.Clear;
end;

procedure TFormSupplier.edtenable;
begin
Edtnama.Enabled:= True;
Edtalamat.Enabled:= True;
Edtkota.Enabled:= True;
Edtnohp.Enabled:= True;
Edtperusahaan.Enabled:= True;
end;

procedure TFormSupplier.posisiawal;
begin
edtbersih;
Edtnama.Enabled:= False;
Edtalamat.Enabled:= False;
Edtkota.Enabled:= False;
Edtnohp.Enabled:= False;
Edtperusahaan.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormSupplier.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormSupplier.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormSupplier.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormSupplier.bsimpanClick(Sender: TObject);
begin
  if (Edtnama.Text='') or (Edtalamat.Text='') or (Edtkota.Text='') or (Edtnohp.Text='') or (Edtperusahaan.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tb_supplier values (null,"'+Edtnama.Text+'","'+Edtalamat.Text+'","'+Edtkota.Text+'","'+Edtnohp.Text+'","'+Edtperusahaan.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tb_supplier');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormSupplier.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnama.Text:= zqry1.FieldList[1].AsString;
Edtalamat.Text := zqry1.FieldList[2].AsString;
Edtkota.Text:= zqry1.FieldList[3].AsString;
Edtnohp.Text:= zqry1.FieldList[4].AsString;
Edtperusahaan.Text:= zqry1.FieldList[5].AsString;
end;

procedure TFormSupplier.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tb_supplier where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tb_supplier');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormSupplier.beditClick(Sender: TObject);
begin
  if (Edtnama.Text='') or (Edtalamat.Text='') or (Edtkota.Text='') or (Edtnohp.Text='') or (Edtperusahaan.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnama.Text = zqry1.FieldList[1].AsString) and (Edtalamat.Text = zqry1.FieldList[2].AsString) AND (Edtkota.Text = zqry1.FieldList[3].AsString) and (Edtnohp.Text = zqry1.FieldList[4].AsString) and (Edtperusahaan.Text = zqry1.FieldList[5].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tb_supplier set nama_supplier="'+Edtnama.Text+'", alamat="'+Edtalamat.Text+'", kota_asal="'+Edtkota.Text+'", no_hp="'+Edtnohp.Text+'", perusahaan_asal="'+Edtperusahaan.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tb_supplier');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormSupplier.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
