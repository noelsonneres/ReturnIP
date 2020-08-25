unit RetornarIp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Winsock, IdIPWatch,
  IdBaseComponent, IdComponent;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    IdIPWatch1: TIdIPWatch;
    Label1: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    function GetIP: string;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  edit1.Text := idipwatch1.LocalIP;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.Text := GetIP;
end;

function TForm1.GetIP: string;
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: string;
begin
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PansiChar(Name), 255);
  SetLength(Name, StrLen(PWideChar(Name)));
  HostEnt := gethostbyname(PansiChar(Name));
  with HostEnt^ do
    Result := Format('%d.%d.%d.%d', [Byte(h_addr^[0]), Byte(h_addr^[1]), Byte(h_addr
      ^[2]), Byte(h_addr^[3])]);
  WSACleanup;

end;


end.

