unit UnitAdmin;

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
    { begin
      Create( username + '.txt');
      AssignFile(textCreate, username + 'txt');
      Writeln(textCreate, username);
      Writeln(textCreate, userpass);
      end; }
  end;
  end.
