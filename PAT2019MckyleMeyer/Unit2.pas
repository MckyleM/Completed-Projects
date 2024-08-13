unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAdmin = class(TForm)
    PnlNAdmin: TPanel;
    PnlNuweUser: TPanel;
    edtNewUserName: TEdit;
    edtPass: TEdit;
    EdtRePass: TEdit;
    LblNName: TLabel;
    lblNPWord: TLabel;
    LblRePass: TLabel;
    procedure PnlNuweUserClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;
  textCreate: TextFile;
  username: string;
  userpass, testpass: string;

implementation

{$R *.dfm}





procedure TfrmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmAdmin.PnlNuweUserClick(Sender: TObject);
begin
  username := edtNewUserName.text;
  userpass := edtPass.text;
  testpass := EdtRePass.text;
  if userpass <> testpass then
    showmessage('Jou wagwoorde koregeer nie')
  else
  begin
    AssignFile(textCreate, username + '.txt');
    if FileExists(username + '.txt') then
      Append(textCreate)
    else

    begin

      Rewrite(textCreate);
      Writeln(textCreate, username);
      Writeln(textCreate, userpass);
      CloseFile(textCreate);
    end;
  end;

end;

{function Wagwoordtoets(const aValue: string): string;
const
  CHARS = ['0'..'9', 'a'..'z', 'A'..'Z'];
var
  i: Integer;
begin
  Result :=  aValue;
  for i := 1 to Length(Result) do
  begin
    if not (Result[i] in CHARS) then
      raise Exception.Create('Non valido');
  end;
end;}


end.
