unit Barang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls,
  ExtCtrls;

type
  TFormBarang = class(TForm)
    shp1: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl3: TLabel;
    Edtbarcode: TEdit;
    Edtnama: TEdit;
    Edtjumlah: TEdit;
    Edttype: TEdit;
    Edtukuran: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bprint: TButton;
    bbatal: TButton;
    bhapus: TButton;
    dbgrd1: TDBGrid;
    Edtrak: TEdit;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    lbl6: TLabel;
    lbl8: TLabel;
    Edtjual: TEdit;
    Edtbeli: TEdit;
    lbl9: TLabel;
    Edttahun: TEdit;
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
  FormBarang: TFormBarang;
  id: string;

implementation

{$R *.dfm}

{ TFormBarang }

procedure TFormBarang.edtbersih;
begin
Edtbarcode.Clear;
Edtnama.Clear;
Edtjumlah.Clear;
Edtjual.Clear;
Edtbeli.Clear;
Edttype.Clear;
Edtukuran.Clear;
Edtrak.Clear;
Edttahun.Clear;
end;

procedure TFormBarang.edtenable;
begin
Edtbarcode.Enabled:= True;
Edtnama.Enabled:= True;
Edtjumlah.Enabled:= True;
Edtjual.Enabled:= True;
Edtbeli.Enabled:= True;
Edttype.Enabled:= True;
Edtukuran.Enabled:= True;
Edtrak.Enabled:= True;
Edttahun.Enabled:= True;
end;

procedure TFormBarang.posisiawal;
begin
edtbersih;
Edtbarcode.Enabled:= False;
Edtnama.Enabled:= False;
Edtjumlah.Enabled:= False;
Edtjual.Enabled:= False;
Edtbeli.Enabled:= False;
Edttype.Enabled:= False;
Edtukuran.Enabled:= False;
Edtrak.Enabled:= False;
Edttahun.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;
end;

procedure TFormBarang.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TFormBarang.bbatalClick(Sender: TObject);
begin
posisiawal;
end;

procedure TFormBarang.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;
end;

procedure TFormBarang.bsimpanClick(Sender: TObject);
begin
  if (Edtbarcode.Text='') or (Edtnama.Text='') or (Edtjumlah.Text='') or (Edtjual.Text='') or (Edtbeli.Text='') or (Edttype.Text='') or (Edtukuran.Text='') or (Edtrak.Text='') or (Edttahun.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into tbl_barang values (null,"'+Edtbarcode.Text+'","'+Edtnama.Text+'","'+Edtjumlah.Text+'","'+Edtjual.Text+'","'+Edtbeli.Text+'","'+Edttype.Text+'","'+Edtukuran.Text+'","'+Edtrak.Text+'","'+Edttahun.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_barang');
  zqry1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  posisiawal;

  end;

end;

procedure TFormBarang.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtbarcode.Text:= zqry1.FieldList[1].AsString;
Edtnama.Text := zqry1.FieldList[2].AsString;
Edtjumlah.Text:= zqry1.FieldList[3].AsString;
Edtjual.Text:= zqry1.FieldList[4].AsString;
Edtbeli.Text:= zqry1.FieldList[5].AsString;
Edttype.Text:= zqry1.FieldList[6].AsString;
Edtukuran.Text := zqry1.FieldList[7].AsString;
Edtrak.Text:= zqry1.FieldList[8].AsString;
Edttahun.Text:= zqry1.FieldList[9].AsString;
end;

procedure TFormBarang.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tbl_barang where id="'+id+'"');
zqry1.ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tbl_barang');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;

end;

end;

procedure TFormBarang.beditClick(Sender: TObject);
begin
  if (Edtbarcode.Text='') or (Edtnama.Text='') or (Edtjumlah.Text='') or (Edtjual.Text='') or (Edtbeli.Text='') or (Edttype.Text='') or (Edtukuran.Text='') or (Edtrak.Text='') or (Edttahun.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtbarcode.Text = zqry1.FieldList[1].AsString) and (Edtnama.Text = zqry1.FieldList[2].AsString) AND (Edtjumlah.Text = zqry1.FieldList[3].AsString) and (Edtjual.Text = zqry1.FieldList[4].AsString) and (Edtbeli.Text = zqry1.FieldList[5].AsString) AND (Edttype.Text = zqry1.FieldList[6].AsString) and (Edtukuran.Text = zqry1.FieldList[7].AsString) and (Edtrak.Text = zqry1.FieldList[8].AsString) and (Edttahun.Text = zqry1.FieldList[9].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update tbl_barang set barcode="'+Edtbarcode.Text+'", nama_barang="'+Edtnama.Text+'", jumlah_stok="'+Edtjumlah.Text+'", harga_jual="'+Edtjual.Text+'", harga_beli="'+Edtbeli.Text+'", type_hp="'+Edttype.Text+'", ukuran_hp="'+Edtukuran.Text+'", rak="'+Edtrak.Text+'", tahun="'+Edttahun.Text+'" where id="'+id+'"');
  zqry1.ExecSQL;
  zqry1.SQL.Clear;
  zqry1.SQL.Add('select*from tbl_barang');
  zqry1.Open;
  posisiawal;
  end;

end;

procedure TFormBarang.bprintClick(Sender: TObject);
begin
frxrprt1.ShowReport();
end;

end.
