"""
Scopo: Eseguire l'applicazione SpotiDownloader da qualsiasi cartella.
E' il collegamento all'applicazione che non può essere spostata dalla cartella build di cx_Freeze.
"""


import os
import platform
from plyer import notification

piattaforma = platform.system()

#Impostare radice percorso
if piattaforma == "Linux":
    percorso_base = "/home/"+os.getlogin()+"/"
elif piattaforma == "Windows":
    percorso_base = "C://Users/"+os.getlogin()+"/Downloads/"
print(percorso_base)

#Trova il file
os.chdir(percorso_base)
try:
    os.chdir("FilePython-main") #Nome cartella
    print(os.getcwd())
except:
    notification.notify(title = 'SpotiDownloader',message = 'Errore, File Non Trovato',app_name="SpotiDownloader",ticker="SpotiDownloader",timeout = 5)


""" for dirpath, dirnames, files in os.walk(os.path.abspath(percorso_base)):
    for f in files:
        if piattaforma == "Windows":
            if f == "main_file.exe" and "build\exe.win-amd64-3.8" in dirpath: # "/build/exe.linux-x86_64-3.10" in dirpath or
                print(f,dirpath)
                os.chdir(dirpath)
                os.system(dirpath+"/"+f)
        elif piattaforma == "Linux":
            if f == "main_file" and "/build/exe.linux-x86_64-3.10" in dirpath:
                print(f,dirpath)
                os.chdir(dirpath)
                os.system(dirpath+"/"+f)
            

 """