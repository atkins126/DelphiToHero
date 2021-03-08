unit DelphiToHero.View.Pages.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Router4D.Interfaces;

type
  TfrmPageUsuarios = class(TForm, iRouter4DComponent)
    Panel1: TPanel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function Render: TForm;
    procedure UnRender;
  end;

var
  frmPageUsuarios: TfrmPageUsuarios;

implementation

{$R *.dfm}

uses DelphiToHero.View.Styles.Color;

{ TfrmPageUsuarios }

function TfrmPageUsuarios.Render: TForm;
begin
  Result := Self;
  Panel1.Color := COLOR_BACKGROUND;
end;

procedure TfrmPageUsuarios.UnRender;
begin

end;

end.
