unit DelphiToHero.View.Pages.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Router4D.Interfaces,
  Bind4D.Attributes,
  Bind4D,
  DelphiToHero.View.Styles.Color;

type
  TfrmPagePrincipal = class(TForm, iRouter4DComponent)
    [Translation('Bem Vindo ao Sistema Delphi')]
    [ComponentBindStyle(clbtnface, FONT_H2, FONT_COLOR3, FONT_NAME)]
    Label1: TLabel;
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
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

{ TfrmPagePrincipal }

procedure TfrmPagePrincipal.FormCreate(Sender: TObject);
begin
  Panel1.Color := COLOR_BACKGROUND;
  TBind4D.New
    .Form(Self)
    .SetCaptionComponents
    .SetStyleComponents;
end;

function TfrmPagePrincipal.Render: TForm;
begin
  Result := Self;
  Panel1.Color := COLOR_BACKGROUND;
end;

procedure TfrmPagePrincipal.UnRender;
begin

end;

end.
