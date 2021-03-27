unit DelphiToHero.Model.DAO.REST;

interface

uses
  Data.DB,
  Vcl.Forms,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  RESTRequest4D,
  Bind4D,
  DelphiToHero.Model.DAO.Interfaces;

type
  TDAOREST = class(TInterfacedObject, iDAOInterface)
  private
    FDMemTable1: TFDMemTable;
    FBaseUrl: string;
    FEndPoint, FPK, FOrderBy, FSort: string;
    FForm: TForm;
    FParamList: TDictionary<string, string>;
    function PrepareGuuid(aGuuid: string): string;
  public
    constructor Create(AForm: TForm);
    destructor Destroy; override;
    class function New(AForm: TForm) : iDAOInterface;
    function Get : iDAOInterface;
    function Post : iDAOInterface;
    function Put : iDAOInterface;
    function Delete : iDAOInterface;
    function DataSource(ADataSet: TDataSource) : iDAOInterface;
    function DataSet: TDataSet;
    function AddParam(aKey: string; aValue: string) : iDAOInterface;
  end;

implementation

uses
  System.JSON, System.SysUtils, System.StrUtils;

{ TDAOREST }

function TDAOREST.AddParam(aKey, aValue: string): iDAOInterface;
begin
  Result := Self;
  FParamList.Add(aKey, aValue);
end;

constructor TDAOREST.Create(AForm: TForm);
begin
  FDMemTable1 := TFDMemTable.Create(nil);
  FParamList := TDictionary<string, string>.Create;
  FBaseUrl := 'http://localhost:9000';
  FForm := AForm;

  TBind4D.New.Form(FForm).BindFormRest(FEndPoint, FPK, FSort, FOrderBy);
end;

function TDAOREST.DataSet: TDataSet;
begin
  Result := FDMemTable1;
end;

function TDAOREST.DataSource(ADataSet: TDataSource): iDAOInterface;
begin
  Result := Self;
  ADataSet.DataSet := FDMemTable1;
end;

function TDAOREST.Delete: iDAOInterface;
var
  aJSON: TJSONObject;
begin
  Result := Self;
  aJSON := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try

    TRequest.New
      .BaseURL(FBaseUrl+ FEndPoint + '/' + PrepareGuuid(FDMemTable1.FieldByName(FPK).AsString))
      .Accept('application/json')
      .AddBody(aJSON.ToJSON)
    .Delete;

  finally
    aJSON.Free;
  end;
end;

destructor TDAOREST.Destroy;
begin
  FDMemTable1.Free;
  FParamList.Free;
  inherited;
end;

function TDAOREST.Get: iDAOInterface;
var
  aURL: string;
  Params: TPair<string, string>;
begin
  Result := Self;

  try
    aURL := FBaseUrl + FEndPoint + '?';

    for Params in FParamList do
      aURL := aURL + Params.Key + '=' + Params.Value + '&';
  finally
    aURL := Copy(aURL, 1, Length(aUrl) -1);
  end;

  TRequest.New.BaseURL(aURL).Accept('application/json').DataSetAdapter(FDMemTable1).Get;
  FParamList.Clear;
end;

class function TDAOREST.New(AForm: TForm) : iDAOInterface;
begin
  Result := Self.Create(AForm);
end;

function TDAOREST.Post: iDAOInterface;
var
  aJSON: TJSONObject;
begin
  Result := Self;
  aJSON := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try

    TRequest.New
      .BaseURL(FBaseUrl + FEndPoint)
      .Accept('application/json')
      .AddBody(aJSON.ToJSON)
    .Post;

  finally
    aJSON.Free;
  end;
end;

function TDAOREST.PrepareGuuid(aGuuid: string): string;
begin
  Result := StringReplace(aGuuid, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

function TDAOREST.Put: iDAOInterface;
var
  aJSON: TJSONObject;
begin
  Result := Self;
  aJSON := TBind4D.New.Form(FForm).FormToJson(fbPost);
  try

    TRequest.New
      .BaseURL(FBaseUrl+ FEndPoint + '/' + PrepareGuuid(FDMemTable1.FieldByName(FPK).AsString))
      .Accept('application/json')
      .AddBody(aJSON.ToJSON)
    .Put;

  finally
    aJSON.Free;
  end;
end;

end.
