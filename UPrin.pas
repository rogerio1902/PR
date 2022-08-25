unit UPrin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrmPrin = class(TForm)
    MMnuPrin: TMainMenu;
    MICadastro: TMenuItem;
    MISep1: TMenuItem;
    MISair: TMenuItem;
    MIRelatorio: TMenuItem;
    MIRelCadastro: TMenuItem;
    MICadClientes: TMenuItem;
    ImgPrin: TImage;
    SttBrPrin: TStatusBar;
    procedure MISairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MICadClientesClick(Sender: TObject);
    procedure MIRelCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrin: TFrmPrin;

implementation

{$R *.dfm}

uses UCadClientes, URelClientes, UDM;

procedure TFrmPrin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja realmente sair?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = MRNO then
    Abort;
end;

procedure TFrmPrin.MICadClientesClick(Sender: TObject);
begin
  FrmCadClientes.ShowModal;
end;

procedure TFrmPrin.MIRelCadastroClick(Sender: TObject);
begin
  FrmRelClientes.ShowModal;
end;

procedure TFrmPrin.MISairClick(Sender: TObject);
begin
  Close;
end;

end.
