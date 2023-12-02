unit Stok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, ExtCtrls;

type
  TFormStok = class(TForm)
    shp1: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    Edtdeskripsi: TEdit;
    Edtjumlah: TEdit;
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
    cbb1: TComboBox;
    zqry2: TZQuery;
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
  FormStok: TFormStok;
  id: string;

implementation

{$R *.dfm}

procedure TFormStok.edtbersih;
begin
Edtdeskripsi.Clear;
Edtjumlah.Clear;
end;

procedure TFormStok.edtenable;
begin
cbb1.Enabled:= True;
Edtdeskripsi.Enabled:= True;
Edtjumlah.Enabled:= True;
end;

procedure TFormStok.posisiawal;
begin
edtbersih;
cbb1.Enabled:= False;
Edtdeskripsi.Enabled:= False;
Edtjumlah.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormStok.FormShow(Sender: TObject);
begin
posisiawal;

// Menampilkan barang_id ke dalam ComboBox
cbb1.Items.Clear;
zqry2.SQL.Clear;
zqry2.SQL.Add('SELECT id FROM tbl_barang');
zqry2.Open;

while not zqry2.Eof do
begin
  cbb1.Items.Add(zqry2.FieldByName('id').AsString);
  zqry2.Next;
end;

zqry2.Close;


// Menampilkan data dari tabel stok
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM tbl_stok');
zqry1.Open;

// Menghubungkan tabel peminjaman dengan DataSource
ds1.DataSet := zqry1;
dbgrd1.DataSource := ds1;

end;

procedure TFormStok.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormStok.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormStok.bsimpanClick(Sender: TObject);
begin
  if (Edtdeskripsi.Text='') or (Edtjumlah.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tbl_stok values (null,"'+cbb1.Text+'","'+Edtdeskripsi.Text+'","'+Edtjumlah.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_stok');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormStok.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

cbb1.Text:= zqry1.FieldList[1].AsString;
Edtdeskripsi.Text:= zqry1.FieldList[2].AsString;
Edtjumlah.Text:= zqry1.FieldList[3].AsString;
end;

procedure TFormStok.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tbl_stok where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tbl_stok');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;
end;

procedure TFormStok.beditClick(Sender: TObject);
begin
  if (Edtdeskripsi.Text='') or (Edtjumlah.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtdeskripsi.Text = zqry1.FieldList[1].AsString) and (Edtjumlah.Text = zqry1.FieldList[2].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tbl_stok set barang_id="'+cbb1.Text+'", descripsi="'+Edtdeskripsi.Text+'", jumlah="'+Edtjumlah.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_stok');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormStok.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
