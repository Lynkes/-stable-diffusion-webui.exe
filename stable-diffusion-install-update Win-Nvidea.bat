@title Stable Diffusion WebUI Windowns 10/11
@echo off

set inst_dir=%CD%
cd /d "%inst_dir%"

if not exist "stable-diffusion-webui\" (
    cmd /c git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
)
cd /d "stable-diffusion-webui"

echo Stable Diffusion WebUI Update?
git pull

echo Extensions Update?
call extensions_clone_here.bat
cd "extensions"
for /d %%G in (*) do (
    cd "%%G"
    git pull
    cd ..
)
cd ..
echo.
call webui-user.bat