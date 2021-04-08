unit DelphiToHero.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type
  iDAOInterface = interface
    ['{6B34ED46-58B1-48EA-BFD6-E46B80461A73}']
    function Get : iDAOInterface;
    function Post : iDAOInterface;
    function Put : iDAOInterface;
    function Delete : iDAOInterface;
    function DataSource(ADataSet: TDataSource) : iDAOInterface;
    function DataSet: TDataSet;
    function AddParam(aKey: string; aValue: string) : iDAOInterface;
    function Page: Integer; overload;
    function Page(AValue: Integer): iDAOInterface; overload;
    function Limit: Integer; overload;
    function Limit(AValue: Integer): iDAOInterface; overload;
    function Total(aValue: Integer): iDAOInterface; overload;
    function Total: Integer; overload;
    function Pages(aValue: Integer): iDAOInterface; overload;
    function Pages: Integer; overload;
  end;

implementation

end.
