unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, AdvGlassButton, ExtCtrls, pngimage;

type
  TForm11 = class(TForm)
    Label1: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    AdvGlassButton12: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label5: TLabel;
    Label7: TLabel;
    Image1: TImage;
    procedure SpinEdit1Change(Sender: TObject);
    procedure AdvGlassButton12Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit3Exit(Sender: TObject);
  private
    send_cmd:bool;
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit1;

{$R *.dfm}



procedure update_values;
begin

Form11.SpinEdit1.MaxValue:=Form11.SpinEdit2.Value-1;
Form11.SpinEdit3.MaxValue:=Form11.SpinEdit2.Value-1;
Form11.SpinEdit3.MinValue:=Form11.SpinEdit1.Value;
if Form11.SpinEdit1.Value>Form11.SpinEdit3.Value then
Form11.SpinEdit3.Value:=Form11.SpinEdit1.Value;
Form11.SpinEdit2.MinValue:=Form11.SpinEdit3.Value+1;

if Form11.SpinEdit1.Value>Form11.SpinEdit1.MaxValue then
Form11.SpinEdit1.Value:=Form11.SpinEdit1.MaxValue;

if Form11.SpinEdit2.Value>Form11.SpinEdit2.MaxValue then
Form11.SpinEdit2.Value:=Form11.SpinEdit2.MaxValue;

if Form11.SpinEdit3.Value>Form11.SpinEdit3.MaxValue then
Form11.SpinEdit3.Value:=Form11.SpinEdit3.MaxValue;

if Form11.SpinEdit1.Value<Form11.SpinEdit1.MinValue then
Form11.SpinEdit1.Value:=Form11.SpinEdit1.MinValue;

if Form11.SpinEdit2.Value<Form11.SpinEdit2.MinValue then
Form11.SpinEdit2.Value:=Form11.SpinEdit2.MinValue;

if Form11.SpinEdit3.Value<Form11.SpinEdit3.MinValue then
Form11.SpinEdit3.Value:=Form11.SpinEdit3.MinValue;
end;

procedure TForm11.AdvGlassButton12Click(Sender: TObject);
begin
update_values();
if (settings_mode=17) then begin
settings_data_ext :=byte(Form11.SpinEdit2.Value) + ( byte(Form11.SpinEdit3.Value) shl 8)+ ( byte(Form11.SpinEdit1.Value) shl 16);
send_cmd:=true;
Form11.Close;
send_new_settings_ext(17);
end;
end;

procedure TForm11.AdvGlassButton1Click(Sender: TObject);
begin
send_cmd:=false;
Form11.Close;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if   send_cmd=false then
   Form1.AdvGlassButton12.Click;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
send_cmd:=false;
end;

procedure TForm11.SpinEdit1Change(Sender: TObject);
begin
//update_values();

end;

procedure TForm11.SpinEdit2Change(Sender: TObject);
begin
//update_values();
end;

procedure TForm11.SpinEdit3Exit(Sender: TObject);
begin
//update_values();
end;

end.
