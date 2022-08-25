unit UCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, idHTTP, IdSSLOpenSSL, Vcl.ExtCtrls,
  Vcl.DBCGrids, Vcl.Mask, Vcl.DBCtrls, Data.DB, xmldom, XMLIntf, msxmldom,
  XMLDoc;

type
  TFrmCadClientes = class(TForm)
    BvlTopo: TBevel;
    SBtnIncluir: TSpeedButton;
    SBtnGravar: TSpeedButton;
    SBtnCancelar: TSpeedButton;
    SBtnExcluir: TSpeedButton;
    BEdtPesq: TButtonedEdit;
    LblCliCod: TLabel;
    DBTxtCliId: TDBText;
    LblCliNome: TLabel;
    DBEdtCliNome: TDBEdit;
    LblCliRG: TLabel;
    DBEdtCliRG: TDBEdit;
    LblCliCPF: TLabel;
    DBEdtCliCPF: TDBEdit;
    LblCliPai: TLabel;
    DBEdtCliPai: TDBEdit;
    LblCliMae: TLabel;
    DBEdtCliMae: TDBEdit;
    DBCtrlGrdCadCli: TDBCtrlGrid;
    SBtnIncluirEnd: TSpeedButton;
    SBtnConfirmarEnd: TSpeedButton;
    SBtnCancelarEnd: TSpeedButton;
    SBtnExcluirEnd: TSpeedButton;
    DBEdtEnd: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdtNum: TDBEdit;
    Label3: TLabel;
    DBEdtCid: TDBEdit;
    Label4: TLabel;
    DBEdtUF: TDBEdit;
    Label5: TLabel;
    DBEdtCEP: TDBEdit;
    ImgCEP: TImage;
    SBtnInserirEnd: TSpeedButton;
    XMLDocument: TXMLDocument;
    procedure Habilitar;
    procedure BEdtPesqRightButtonClick(Sender: TObject);
    procedure BEdtPesqKeyPress(Sender: TObject; var Key: Char);
    procedure SBtnIncluirClick(Sender: TObject);
    procedure SBtnGravarClick(Sender: TObject);
    procedure SBtnCancelarClick(Sender: TObject);
    procedure SBtnExcluirClick(Sender: TObject);
    procedure SBtnIncluirEndClick(Sender: TObject);
    procedure SBtnConfirmarEndClick(Sender: TObject);
    procedure SBtnCancelarEndClick(Sender: TObject);
    procedure SBtnExcluirEndClick(Sender: TObject);
    procedure SBtnInserirEndClick(Sender: TObject);
    procedure ImgCEPClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;

implementation

{$R *.dfm}

uses UDM, UPesq;

procedure TFrmCadClientes.Habilitar;
begin
  with DM.ADOQClientes do
  begin
    BEdtPesq.    Enabled := State = dsBrowse;
    SBtnIncluir. Enabled := BEdtPesq.Enabled;
    SBtnGravar.  Enabled := State in [dsInsert, dsEdit];
    SBtnExcluir. Enabled := (State = dsBrowse) and (RecordCount > 0);
    SBtnCancelar.Enabled := SBtnGravar.Enabled;
  end;
  if Self.Visible then
    with BEdtPesq do
      if Enabled then
      begin
        SetFocus;
        SelectAll;
      end;
  with DM.CDSEndClientes do
  begin
    SBtnIncluirEnd.  Enabled := State = dsBrowse;
    SBtnInserirEnd.  Enabled := SBtnIncluirEnd.Enabled and (RecordCount > 0);
    SBtnConfirmarEnd.Enabled := State in [dsInsert, dsEdit];
    SBtnExcluirEnd.  Enabled := (State = dsBrowse) and (RecordCount > 0);
    SBtnCancelarEnd. Enabled := SBtnConfirmarEnd.Enabled;
  end;
end;

procedure TFrmCadClientes.ImgCEPClick(Sender: TObject);
var
  tempXML :IXMLNode;
begin
  try
    XMLDocument.FileName := 'https://viacep.com.br/ws/' + Trim(DBEdtCEP.text) + '/xml/';
    XMLDocument.Active   := True;
    tempXML              := XMLDocument.DocumentElement;
    with DM.CDSEndClientes do
    begin
      if not (State in [dsInsert, dsEdit]) then
        Edit;
      FieldByName('Endereco').AsString := tempXML.ChildNodes.FindNode('logradouro').Text + ' ' +
                                          tempXML.ChildNodes.FindNode('bairro').Text;
      FieldByName('Cidade').  AsString := tempXML.ChildNodes.FindNode('localidade').Text;
      FieldByName('Estado').  AsString := tempXML.ChildNodes.FindNode('uf').Text;
      FieldByName('Num').     AsString := '';
      DBEdtNum.SetFocus;
    end;
  except
    on E: Exception do
      Application.MessageBox('Não foi possível encontrar este CEP', 'Erro', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFrmCadClientes.BEdtPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    BEdtPesqRightButtonClick(nil);
  end;
end;

procedure TFrmCadClientes.BEdtPesqRightButtonClick(Sender: TObject);
var
  vId: Integer;

  procedure Localizar(pId: Integer);
  begin
    with DM.ADOQClientes, SQL do
    begin
      Close;
      Text := 'select * from clientes where Id = 0' + IntToStr(pId);
      Open;
    end;
  end;

begin
  with DM.ADOQGen, SQL do
  begin
    Close;
    vId := StrToIntDef(BEdtPesq.Text, 0);
    if vId <> 0 then
    begin
      Text := 'select * from clientes where Id = ' + BEdtPesq.Text;
      Open;
    end;
    if (not Active) or (RecordCount = 0) then
    begin
      Text := 'select * from Clientes where Concat(nome, CPF, RG, NomePai, NomeMae) like ''%' + BEdtPesq.Text + '%''';
      Open;
    end;
    if RecordCount = 0 then
      Application.MessageBox('Não encontrado', 'Atenção', MB_OK + MB_ICONWARNING)
    else
    begin
      if RecordCount > 1 then
        if FrmPesq.ShowModal = mrCancel then
          Exit;
      Localizar(FieldByName('Id').AsInteger);
    end;
  end;
  Habilitar;
end;

procedure TFrmCadClientes.FormShow(Sender: TObject);
begin
  Habilitar;
end;

procedure TFrmCadClientes.SBtnCancelarClick(Sender: TObject);
begin
  DM.ADOQClientes.Cancel;
  Habilitar;
end;

procedure TFrmCadClientes.SBtnCancelarEndClick(Sender: TObject);
begin
  DM.CDSEndClientes.Cancel;
  Habilitar;
end;

procedure TFrmCadClientes.SBtnConfirmarEndClick(Sender: TObject);
begin
  DM.CDSEndClientes.Post;
  Habilitar;
end;

procedure TFrmCadClientes.SBtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = MRYES then
    DM.ADOQClientes.Delete;
  Habilitar;
end;

procedure TFrmCadClientes.SBtnExcluirEndClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir esse endereço?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = MRYES then
    DM.CDSEndClientes.Delete;
  Habilitar;
end;

procedure TFrmCadClientes.SBtnGravarClick(Sender: TObject);
begin
  DM.ADOQClientes.Post;
  Habilitar;
end;

procedure TFrmCadClientes.SBtnIncluirClick(Sender: TObject);
begin
  DM.ADOQClientes.Insert;
  Habilitar;
  DBEdtCliNome.SetFocus;
end;

procedure TFrmCadClientes.SBtnIncluirEndClick(Sender: TObject);
begin
  DM.CDSEndClientes.Append;
  Habilitar;
  DBEdtEnd.SetFocus;
end;

procedure TFrmCadClientes.SBtnInserirEndClick(Sender: TObject);
begin
  DM.CDSEndClientes.Insert;
  Habilitar;
end;

end.
