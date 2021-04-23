unit DelphiToHero.Model.Services.Register;

interface

type
  TModelServicesRegister = class
  private
    procedure RegisterAWS;
    procedure RegisterGoogleAPI;
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  aServicesRegister: TModelServicesRegister;

implementation

uses
  Bind4D;



{ TModelServicesRegister }

constructor TModelServicesRegister.Create;
begin
  RegisterGoogleAPI;
end;

destructor TModelServicesRegister.Destroy;
begin

  inherited;
end;

procedure TModelServicesRegister.RegisterAWS;
begin

end;

procedure TModelServicesRegister.RegisterGoogleAPI;
begin
//  TBind4D.New
//    .Translator
//    .Google
//    .Credential
//      .Key('')
//    .&End
//    .Options
//      .Cache(True)
//    .&End
//    .Params
//      .Source('pt')
//      .Target('en')
//    .&End;
end;

initialization
  aServicesRegister := TModelServicesRegister.Create;

finalization
  aServicesRegister.Free;


end.
