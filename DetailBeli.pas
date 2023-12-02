unit DetailBeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids,
  ExtCtrls;

type
  TFormDetailBeli = class(TForm)
    shp1: TShape;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
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
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    zqry2: TZQuery;
    zqry3: TZQuery;
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
  FormDetailBeli: TFormDetailBeli;
  id: string;

implementation

{$R *.dfm}

{ TFormDetailBeli }

procedure TFormDetailBeli.edtbersih;
begin
Edtqty.Clear;
Edtharga.Clear;
Edttotal.Clear;
end;

procedure TFormDetailBeli.edtenable;
begin
cbb1.Enabled:= True;
cbb2.Enabled:= True;
Edtqty.Enabled:= True;
Edtharga.Enabled:= True;
Edttotal.Enabled:= True;
end;

procedure TFormDetailBeli.posisiawal;
begin
edtbersih;
cbb1.Enabled:= False;
cbb2.Enabled:= False;
Edtqty.Enabled:= False;
Edtharga.Enabled:= False;
Edttotal.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormDetailBeli.FormShow(Sender: TObject);
begin
posisiawal;

// Menampilkan supplier_id  ke dalam ComboBox
cbb1.Items.Clear;
zqry2.SQL.Clear;
zqry2.SQL.Add('SELECT id FROM tb_supplier');
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

// Menampilkan data dari tabel detail beli
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM tbl_detail_beli');
zqry1.Open;

// Menghubungkan tabel detail beli dengan DataSource
ds1.DataSet := zqry1;
dbgrd1.DataSource := ds1;

end;

procedure TFormDetailBeli.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormDetailBeli.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormDetailBeli.bsimpanClick(Sender: TObject);
begin
  if (Edtqty.Text='') or (Edtharga.Text='') or (Edttotal.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tbl_detail_beli values (null,"'+cbb1.Text+'","'+cbb2.Text+'","'+Edtqty.Text+'","'+Edtharga.Text+'","'+Edttotal.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_detail_beli');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormDetailBeli.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

cbb1.Text:= zqry1.FieldList[1].AsString;
cbb2.Text:= zqry1.FieldList[2].AsString;
Edtqty.Text:= zqry1.FieldList[3].AsString;
Edtharga.Text:= zqry1.FieldList[4].AsString;
Edttotal.Text:= zqry1.FieldList[5].AsString;
end;

procedure TFormDetailBeli.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tbl_detail_beli where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tbl_detail_beli');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;
end;

procedure TFormDetailBeli.beditClick(Sender: TObject);
begin
  if (Edtqty.Text='') or (Edtharga.Text='') or (Edttotal.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtqty.Text = zqry1.FieldList[3].AsString) and (Edtharga.Text = zqry1.FieldList[4].AsString) AND (Edttotal.Text = zqry1.FieldList[5].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tbl_detail_beli set suppplier_id="'+cbb1.Text+'", barang_id="'+cbb2.Text+'", qty="'+Edtqty.Text+'", harga_beli="'+Edtharga.Text+'", total="'+Edttotal.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_detail_beli');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormDetailBeli.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
