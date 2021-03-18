program DelphiToHero;

uses
  Vcl.Forms,
  DelphiToHero.View.Principal in 'Src\View\DelphiToHero.View.Principal.pas' {Form2},
  DelphiToHero.View.Styles.Color in 'src\View\Styles\DelphiToHero.View.Styles.Color.pas',
  DelphiToHero.View.Pages.Principal in 'src\View\Pages\DelphiToHero.View.Pages.Principal.pas' {frmPagePrincipal},
  DelphiToHero.View.Routers in 'src\View\Routers\DelphiToHero.View.Routers.pas',
  DelphiToHero.View.Pages.Template in 'src\View\Pages\DelphiToHero.View.Pages.Template.pas' {FormTemplate},
  DelphiToHero.View.Pages.Usuarios in 'src\View\Pages\DelphiToHero.View.Pages.Usuarios.pas' {PageUsuarios};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
