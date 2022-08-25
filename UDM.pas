unit UDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Vcl.ImgList,
  Vcl.Controls, Vcl.Forms, Winapi.Windows, Datasnap.DBClient;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOQClientes: TADOQuery;
    DSClientes: TDataSource;
    ImgLstMenu: TImageList;
    DSEndClientes: TDataSource;
    ADOQGen: TADOQuery;
    DSGen: TDataSource;
    CDSEndClientes: TClientDataSet;
    CDSEndClientesCEP: TStringField;
    CDSEndClientesEndereco: TStringField;
    CDSEndClientesNum: TStringField;
    CDSEndClientesCidade: TStringField;
    CDSEndClientesEstado: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ADOQClientesAfterPost(DataSet: TDataSet);
    procedure ADOQClientesAfterOpen(DataSet: TDataSet);
    procedure CDSEndClientesAfterEdit(DataSet: TDataSet);
    procedure ADOQClientesAfterEdit(DataSet: TDataSet);
    procedure DSClientesStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UCadClientes;

{$R *.dfm}

procedure TDM.ADOQClientesAfterEdit(DataSet: TDataSet);
begin
  FrmCadClientes.Habilitar;
end;

procedure TDM.ADOQClientesAfterOpen(DataSet: TDataSet);
begin
  with CDSEndClientes do
  begin
    AfterInsert := nil;
    DisableControls;
    EmptyDataset;
    ADOQGen.Close;
    ADOQGen.SQL.Text := 'select * from enderecos where ClienteId = 0' + ADOQClientes.FieldByName('Id').AsString;
    ADOQGen.Open;
    while not ADOQGen.Eof do
    begin
      Append;
      FieldByName('Endereco').AsString := ADOQGen.FieldByName('Endereco').AsString;
      FieldByName('Num').     AsString := ADOQGen.FieldByName('Num').     AsString;
      FieldByName('Cidade').  AsString := ADOQGen.FieldByName('Cidade').  AsString;
      FieldByName('Estado').  AsString := ADOQGen.FieldByName('Estado').  AsString;
      FieldByName('CEP').     AsString := ADOQGen.FieldByName('CEP').     AsString;
      Post;
      ADOQGen.Next;
    end;
    First;
    AfterInsert := CDSEndClientesAfterEdit;
    EnableControls;
  end;
end;

procedure TDM.ADOQClientesAfterPost(DataSet: TDataSet);
begin
  with ADOQGen, SQL do
  begin
    Close;
    Text := 'delete from enderecos where ClienteId = 0' + ADOQClientes.FieldByName('Id').AsString;
    ExecSQL;
    if (CDSEndClientes.State in [dsInsert, dsEdit]) then
      CDSEndClientes.Post;
    CDSEndClientes.DisableControls;
    CDSEndClientes.First;
    while not CDSEndClientes.Eof do
    begin
      Text := 'insert into enderecos values (' +
        '''' + ADOQClientes.  FieldByName('Id').      AsString + ''', ' +
        '''' + CDSEndClientes.FieldByName('CEP').     AsString + ''', ' +
        '''' + CDSEndClientes.FieldByName('Endereco').AsString + ''', ' +
        '''' + CDSEndClientes.FieldByName('Num').     AsString + ''', ' +
        '''' + CDSEndClientes.FieldByName('Cidade').  AsString + ''', ' +
        '''' + CDSEndClientes.FieldByName('Estado').  AsString + '''' +
        ')';
      ExecSQL;
      CDSEndClientes.Next;
    end;
    CDSEndClientes.First;
    CDSEndClientes.EnableControls;
  end;
end;

procedure TDM.CDSEndClientesAfterEdit(DataSet: TDataSet);
begin
  if not (ADOQClientes.State in [dsEdit, dsInsert]) then
    ADOQClientes.Edit;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.LoadFromFile('PR.con');
    ADOConnection.Connected        := False;
    ADOConnection.ConnectionString := SL.Text;
    ADOQClientes.Active            := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Não foi possível conectar' + #13#13 + E.Message), 'Erro', MB_OK + MB_ICONERROR);
      Application.Terminate;
    end;
  end;
  SL.Free;
end;

procedure TDM.DSClientesStateChange(Sender: TObject);
var
  Stt: String;
begin
  with ADOQClientes do
  begin
    case State of
      dsInsert: Stt := 'Incluindo';
      dsEdit:   Stt := 'Alterando';
      dsBrowse: Stt := 'Pesquisando';
    end;
  end;
  FrmCadClientes.Caption := 'Cadastro de Clientes - [' + Stt + ']';
end;

end.
