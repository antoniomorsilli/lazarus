unit unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit3.Text := IntToStr(StrToInt(Edit1.Text) + StrToInt(Edit2.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit3.Text := IntToStr(StrToInt(Edit1.Text) - StrToInt(Edit2.Text));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit3.Text := IntToStr(StrToInt(Edit1.Text) * StrToInt(Edit2.Text));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if StrToFloat(Edit2.Text) = 0 then
  Edit3.Text := 'Non si divide per zero'
else
  Edit3.Text := FloatToStr(StrToFloat(Edit1.Text) / StrToFloat(Edit2.Text));
end;

end.

