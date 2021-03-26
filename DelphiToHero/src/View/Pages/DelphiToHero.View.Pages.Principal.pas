unit DelphiToHero.View.Pages.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Router4D.Interfaces;

type
  TfrmPagePrincipal = class(TForm, iRouter4DComponent)
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
  frmPagePrincipal: TfrmPagePrincipal;

implementation

{$R *.dfm}

uses
  DelphiToHero.View.Styles.Color;

{ TfrmPagePrincipal }

function TfrmPagePrincipal.Render: TForm;
begin
  Result := Self;
  Panel1.Color := COLOR_BACKGROUND;
end;

procedure TfrmPagePrincipal.UnRender;
begin

end;

end.
