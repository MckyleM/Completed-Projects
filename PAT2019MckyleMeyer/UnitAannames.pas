unit UnitAannames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFrmaanames = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmaanames: TFrmaanames;

implementation

{$R *.dfm}

procedure TFrmaanames.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

end.
