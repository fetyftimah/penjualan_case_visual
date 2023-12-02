unit Pembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, StdCtrls, ExtCtrls;

type
  TFormPembelian = class(TForm)
    shp1: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    Edtqty: TEdit;
    Edtharga: TEdit;
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
    dtp1: TDateTimePicker;
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
  FormPembelian: TFormPembelian;
  id: string;

implementation

{$R *.dfm}

procedure TFormPembelian.edtbersih;
begin
Edtqty.Clear;
Edtharga.Clear;
Edtjumlah.Clear;
end;

procedure TFormPembelian.edtenable;
begin
cbb1.Enabled:= True;
dtp1.Enabled:= True;
Edtqty.Enabled:= True;
Edtharga.Enabled:= True;
Edtjumlah.Enabled:= True;
end;

procedure TFormPembelian.posisiawal;
begin
edtbersih;
cbb1.Enabled:= False;
dtp1.Enabled:= False;
Edtqty.Enabled:= False;
Edtharga.Enabled:= False;
Edtjumlah.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFormPembelian.FormShow(Sender: TObject);
begin
posisiawal;

// Menampilkan id_supplier ke dalam ComboBox
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


// Menampilkan data dari tabel pembelian
zqry1.SQL.Clear;
zqry1.SQL.Add('SELECT * FROM tbl_pembelian');
zqry1.Open;

// Menghubungkan tabel pembelian dengan DataSource
ds1.DataSet := zqry1;
dbgrd1.DataSource := ds1;

end;

procedure TFormPembelian.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormPembelian.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormPembelian.bsimpanClick(Sender: TObject);
begin
  if (Edtqty.Text='') or (Edtharga.Text='') or (Edtjumlah.Text='')  then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tbl_pembelian values (null, "'+cbb1.Text+'","'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'","'+Edtqty.Text+'","'+Edtharga.Text+'","'+Edtjumlah.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_pembelian');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormPembelian.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

cbb1.Text:= zqry1.FieldList[1].AsString;
dtp1.Date := StrToDate(zqry1.FieldList[2].AsString);
Edtqty.Text:= zqry1.FieldList[3].AsString;
Edtharga.Text:= zqry1.FieldList[4].AsString;
Edtjumlah.Text:= zqry1.FieldList[5].AsString;
end;

procedure TFormPembelian.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tbl_pembelian where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tbl_pembelian');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormPembelian.beditClick(Sender: TObject);
begin
  if (Edtqty.Text='') or (Edtharga.Text='') or (Edtjumlah.Text='')  then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtqty.Text = zqry1.FieldList[1].AsString) and (Edtharga.Text = zqry1.FieldList[2].AsString) AND (Edtjumlah.Text = zqry1.FieldList[3].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tbl_pembelian set suppplier_id="'+cbb1.Text+'", tanggal="'+FormatDateTime('yyyy-mm-dd', dtp1.Date)+'", qty="'+Edtqty.Text+'", harga="'+Edtharga.Text+'", jumlah_bayar="'+Edtjumlah.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_pembelian');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormPembelian.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
