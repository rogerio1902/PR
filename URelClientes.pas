unit URelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, frxClass,
  frxDBSet;

type
  TFrmRelClientes = class(TForm)
    DBGrdResFiltro: TDBGrid;
    BBtnFiltrar: TBitBtn;
    BEdtFiltro: TButtonedEdit;
    RGrpOrdem: TRadioGroup;
    LblFiltro: TLabel;
    LblResFiltro: TLabel;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    BBrnImpr: TBitBtn;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBrnImprClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frxReportBeforePrint(Sender: TfrxReportComponent);
    procedure BEdtFiltroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClientes: TFrmRelClientes;

implementation

{$R *.dfm}

uses UDM;

procedure TFrmRelClientes.BBrnImprClick(Sender: TObject);
begin
  frxReport.ShowReport;
end;

procedure TFrmRelClientes.BBtnFiltrarClick(Sender: TObject);
var
  Ordem: String;
begin
  if RGrpOrdem.ItemIndex = 0 then Ordem := 'Nome' else Ordem := 'Id';
  with DM.ADOQGen, SQL do
  begin
    Close;
    Text := 'select * from Clientes C left join enderecos E on E.ClienteId = C.Id where Concat(Nome, ''|'', CPF, ''|'', RG, ''|'', NomePai, ''|'', NomeMae, ''|'', Endereco, ''|'', Num, ''|'', Cidade, ''|'', Estado, ''|'', CEP) like ''%' + BEdtFiltro.Text + '%'' order by ' + Ordem;
    Open;
    if RecordCount = 0 then
    begin
      Application.MessageBox('Nada encontrado', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
end;

procedure TFrmRelClientes.BEdtFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BBtnFiltrar.Click;
  end;
end;

procedure TFrmRelClientes.FormShow(Sender: TObject);
begin
  DM.ADOQGen.Close;
  BEdtFiltro.SetFocus;
end;

procedure TFrmRelClientes.frxReportBeforePrint(Sender: TfrxReportComponent);
begin
  if Sender.Name = 'MasterData' then
    (Sender as TfrxMasterData).Visible := DM.ADOQGen.FieldByName('Endereco').AsString <> '';
end;

end.
