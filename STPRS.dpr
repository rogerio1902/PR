program STPRS;

uses
  Vcl.Forms,
  UPrin in 'UPrin.pas' {FrmPrin},
  UCadClientes in 'UCadClientes.pas' {FrmCadClientes},
  URelClientes in 'URelClientes.pas' {FrmRelClientes},
  UDM in 'UDM.pas' {DM: TDataModule},
  UPesq in 'UPesq.pas' {FrmPesq};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrin, FrmPrin);
  Application.CreateForm(TFrmCadClientes, FrmCadClientes);
  Application.CreateForm(TFrmRelClientes, FrmRelClientes);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPesq, FrmPesq);
  Application.Run;
end.
