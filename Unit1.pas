unit Unit1;

interface

uses
  {$IFDEF ANDROID}
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Print,
  Androidapi.jni, Androidapi.Jni.app,
  Androidapi.Jni.GraphicsContentViewText, Androidapi.JniBridge,
  Androidapi.JNI.Os, Androidapi.Jni.Telephony,
  Androidapi.JNI.JavaTypes, Androidapi.Helpers,
  Androidapi.JNI.Widget,System.Permissions,
  Androidapi.Jni.Provider,Androidapi.Jni.Net,System.Messaging,
  fmx.TextLayout,AndroidAPI.JNI.Support,FMX.VirtualKeyboard,
 {$ENDIF}
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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
uses FMX.Memo, System.IOUtils;

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var intent:JIntent;
uri:JNet_Uri;
begin
//ASÍ SE PIDE EL PERMISO EN ANDROID 11+ Y PARA VERSIONES INFERIORES
//SE DEBE USAR LA PETICIÓN DE PERMISOS QUE SE HA VENIDO MANEJANDO
// PUEDE CONSIDERAR UNA VALIDACION PARA REQUERIR LOS PERMISOS SEGÚN SEA ANDROID 11+ O NO POR EJEMPLO
 if TJBuild_VERSION.JavaClass.SDK_INT>=30 then //30 ES EL NIVEL DE API DE ANDROID 11+
 begin
 //PETICION DE PERMISOS ANDROID 11+
 end else
 begin
 //PETICIÓN DE PERMISOS VERSIONES INFERIORES DE ANDROID
 end;
 if TJEnvironment.JavaClass.isExternalStorageManager then
 begin
 ShowMessage('Si hay permiso al almacenamiento');
 end else
 begin
 intent:=TJIntent.Create;
 //Puede asignar una acción mediante su string
 //intent.setAction(StringToJString('android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION'));
 intent.setAction(TJSettings.JavaClass.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
 Uri:= TJnet_Uri.JavaClass.parse(StringToJString(Concat('package:',
 JStringToString(TAndroidHelper.Context.getPackageName))));
 intent.setData(Uri);
 TAndroidHelper.Activity.startActivity(intent);
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var x:TMemo;
begin
x:=TMemo.Create(nil);
x.Parent:=self;
x.Text:='Hola';
 if TJEnvironment.JavaClass.isExternalStorageManager then
 begin
  if not TDirectory.Exists('/sdcard/'+'Dir1') then TDirectory.CreateDirectory('/sdcard/'+'Dir1');
 x.Lines.SaveToFile('/sdcard/'+'Dir1/'+'Arch1.txt');
 x.Free;
 ShowMessage('Se creó el archivo con éxito');
 end else showMessage('Sin permiso al almacenamiento');
end;

end.
