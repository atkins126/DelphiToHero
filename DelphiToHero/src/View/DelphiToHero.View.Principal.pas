unit DelphiToHero.View.Principal;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Router4D,
  Bind4D.Attributes,
  Bind4D,
  DelphiToHero.View.Styles.Color;

type
  TForm2 = class(TForm)
    [Translation('USUARIO')]
    [ImageAttribute('avatar')]
    [ComponentBindStyle(clbtnface, FONT_H7, FONT_COLOR, FONT_NAME)]
    btnUSUARIO: TSpeedButton;
    [Translation('PRINCIPAL')]
    [ImageAttribute('home')]
    [ComponentBindStyle(clbtnface, FONT_H7, FONT_COLOR, FONT_NAME)]
    btnPRINCIPAL: TSpeedButton;
    pnlContent: TPanel;
    pnlFull: TPanel;
    pnlMenu: TPanel;
    pnlLayout: TPanel;
    pnlHeader: TPanel;
    pnlLogo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnPRINCIPALClick(Sender: TObject);
    procedure btnUSUARIOClick(Sender: TObject);
  private
    procedure ApplyStyle;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses DelphiToHero.View.Pages.Principal;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ApplyStyle;
  TRouter4D.Render<TfrmPagePrincipal>.SetElement(pnlLayout, pnlContent);
  TBind4D.New
    .Form(Self)
    .SetImageComponents
    .SetCaptionComponents
    .SetStyleComponents;
end;

procedure TForm2.btnUSUARIOClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Usuarios');
end;

procedure TForm2.btnPRINCIPALClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Principal');
end;

procedure TForm2.ApplyStyle;
begin
  pnlLayout.Color := COLOR_BACKGROUND;
  pnlHeader.Color := COLOR_BACKGROUND_TOP;
  pnlLogo.Color := COLOR_BACKGROUND_DESTAK;
  pnlMenu.Color := COLOR_BACKGROUND_MENU;

  Self.Font.Color := FONT_COLOR;
  Self.Font.Size := FONT_H6;
end;

end.
