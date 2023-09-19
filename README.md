# Delphi-11-Alexandria-Hacer-uso-del-Almacenamiento-en-Android-11-y-Posteriores
--ANTES DE REALIZAR ESTO RECUERDA: 
--SOLO ES PARA DELPHI ALEXANDRIA (11+)
--LOS ARCHIVOS DE LA RAMA "MAIN" SON PARA DELPHI 11.0 
--SE IRÁ ACTUALIZANDO ESTE REPOSITORIO CONFORME SALGAN NUEVAS VERSIONES DE DELPHI AGREGANDO UNA RAMA POR VERSIÓN
--NO SE DEBE TENER ABIERTO EL IDE
--UNA VEZ FINALIZADO SE RECOMIENDA REINICIAR SU EQUIPO

Documentacion 1: https://developer.android.com/training/data-storage/manage-all-files
Documentacion 2: https://developer.android.com/training/data-storage?hl=es-419


Este parche sirve para hacer uso del almacenamiento interno en versiones de Android 11+ por ejemplo: 
- crear carpetas
- crear archivos
- copiar archivos
- eliminar archivos 


----Aplicar Parche

1.- Copiar los archivos correspondientes en la carpeta lib de la ruta de instalacion de su RAD Studio
en mi caso: C:\Program Files (x86)\Embarcadero\Studio\22.0\lib 
(Nota: vienen archivos para Android y Android64 de igual manera archivos en debug y release)

2.- Copiar las units en la carpeta de rtl perteneciente a Android en la ruta de su RAD Studio
en mi caso: C:\Program Files (x86)\Embarcadero\Studio\22.0\source\rtl\android

Codigo que hacia falta: 
{class} function isExternalStorageManager: Boolean; cdecl;
{class} property ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION: JString read _GetACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION;


---Recuerda establecer en "True" el permiso "Manage external storage" en tu proyecto dentro del IDE en el
Apartado de Project Settings





 
