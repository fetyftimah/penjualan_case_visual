unit Return;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, StdCtrls,
  Grids, DBGrids, ExtCtrls;

type
  TFormReturn = class(TForm)
    shp1: TShape;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    Edtharga: TEdit;
    Edttotal: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bprint: TButton;
    bbatal: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    Edtqty: TEdit;
    cbb1: TComboBox;
    cbb2: TComboBox;
    cbb3: TComboBox;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    zqry2: TZQuery;
    zqry3: TZQuery;
    lbl1: TLabel;
    cbb4: TComboBox;
    lbl9: TLabel;
    dtp1: TDateTimePicker;
    zqry4: TZQuery;
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
  FormReturn: TFormReturn;
  id: string;

implementation

{$R *.dfm}

{ TFormReturn }

procedure TFormReturn.edtbersih;
begin
Edtqty.Clear;
Edtharga.Clear;
Edttotal.Clear;
end;

procedure TFormReturn.edtenable;
begin
dtp1.Enabled:= True;
cbb1.Enabled:= True;
cbb2.Enabled:= True;
cbb4.Enabled:= True;
Edtqty.Enabled:= True;
Edtharga.Enabled:= True;
Edttotal.Enabled:= True;
cbb3.Enabled:= True;
end;

procedure TFormReturn.posisiawal;
begin
edtbersih;
dtp1.Enabled:= False;
cbb1.Enabled:= False;
cbb2.Enabled:= False;
cbb4.Enabled:= False;
Edtqty.Enabled:= False;
Edtharga.Enabled:= False;
Edttotal.Enabled:= False;
cbb3.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormReturn.FormShow(Sender: TObject);
begin
posisiawal;

// Menampilkan penjualan_id  ke dalam ComboBox
cbb1.Items.Clear;
zqry2.SQL.Clear;
zqry2.SQL.Add('SELECT id FROM tbl_penjualan');
zqry2.Open;

while not zqry2.Eof do
begin
  cbb1.Items.Add(zqry2.FieldByName('id').AsString);
  zqry2.Next;
end;

zqry2.Close;

// Menampilkan barang_id ke dalam ComboBox
cbb2.Items.Clear;
zqry3.SQL.Clear;
zqry3.SQL.Add('SELECT id FROM tbl_barang');
zqry3.Open;

while not zqry3.Eof do
begin
  cbb2.Items.Add(zqry3.FieldByName('id').AsString);
  zqry3.Next;
end;

zqry3.Close;

// Menampilkan user_id ke dalam ComboBox
cbb4.Items.Clear;
zqry4.SQL.Clear;
zqry4.SQL.Add('SELECT id FROM tb_user');
zqry4.Open;

while not zqry4.Eof do
begin
  cbb4.Items.Add(zqry4.FieldByName('id').AsString);
  zqry4.Next;
end;

zqry4.Close;


// Menampilkan data dari tabel Return
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM tbl_return');
zqry1.Open;

// Menghubungkan tabel penjualan dengan DataSource
ds1.DataSet := zqry1;
dbgrd1.DataSource := ds1;

end;

procedure TFormReturn.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormReturn.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormReturn.bsimpanClick(Sender: TObject);
begin
  if (Edtqty.Text='') or (Edtharga.Text='') or (Edttotal.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tbl_return values (null,"'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+cbb1.Text+'","'+cbb2.Text+'","'+cbb4.Text+'","'+Edtqty.Text+'","'+Edtharga.Text+'","'+Edttotal.Text+'","'+cbb3.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_return');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormReturn.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

dtp1.Date := StrToDate(zqry1.FieldList[1].AsString);
cbb1.Text:= zqry1.FieldList[2].AsString;
cbb2.Text:= zqry1.FieldList[3].AsString;
cbb4.Text:= zqry1.FieldList[4].AsString;
Edtqty.Text:= zqry1.FieldList[5].AsString;
Edtharga.Text:= zqry1.FieldList[6].AsString;
Edttotal.Text:= zqry1.FieldList[7].AsString;
cbb3.Text:= zqry1.FieldList[8].AsString;
end;

procedure TFormReturn.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tbl_return where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tbl_return');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormReturn.beditClick(Sender: TObject);
begin
  if (Edtqty.Text='') or (Edtharga.Text='') or (Edttotal.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtqty.Text = zqry1.FieldList[5].AsString) and (Edtharga.Text = zqry1.FieldList[6].AsString) AND (Edttotal.Text = zqry1.FieldList[7].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tbl_return set tgl_return="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", penjualan_id="'+cbb1.Text+'", barang_id="'+cbb2.Text+'", user_id="'+cbb4.Text+'", qty="'+Edtqty.Text+'", harga_jual="'+Edtharga.Text+'", total_jual="'+Edttotal.Text+'", status="'+cbb3.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_return');
  zqry1.Open;
  posisiawal;
  end;
end;

procedure TFormReturn.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
