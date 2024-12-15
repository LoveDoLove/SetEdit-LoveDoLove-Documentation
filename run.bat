@echo off
color 0A
title Laravel Menu

:Menu
cls
echo.
echo ================================
echo  Laravel Menu
echo ================================
echo.
echo 0. Exit
echo 1. Quick Auto Setup
echo 2. Install Laravel Packages
echo 3. Update Laravel Packages
echo 4. Update Npm Packages
echo 5. Check Require Software
echo 6. Host Laravel
echo 7. Create View Blade Files (Index, Create, Edit, Show) (Auto)
echo 8. Regenerate Composer AutoLoad Files
echo 9. Build To Production
echo.
echo Dangerous:
echo 44. Reset All Cache
echo.
set /p choice=Choose an option: 
if %choice%==0 goto Exit
if %choice%==1 goto Setup
if %choice%==2 goto Install
if %choice%==3 goto UpdateLaravelPackages
if %choice%==4 goto UpdateNpmPackages
if %choice%==5 goto CheckSoftware
if %choice%==6 goto Host
if %choice%==7 goto CreateView
if %choice%==8 goto RegenerateComposerAutoload
if %choice%==9 goto BuildToProduction
if %choice%==44 goto ResetAllCache
goto Menu

:Exit
exit

:Setup
call :Install
call :UpdateLaravelPackages
call :UpdateNpmPackages
start /wait cmd /c "copy .env.example .env"
start /wait cmd /c "php artisan key:generate"
start /wait cmd /c "php artisan migrate"
goto Menu

:Install
call :CheckSoftwareMethod
start /wait cmd /c "npm install"
start /wait cmd /c "composer install -W"
goto Menu

:UpdateLaravelPackages
call :CheckSoftwareMethod
start /wait cmd /c "composer update -W"
goto Menu

:UpdateNpmPackages
call :CheckSoftwareMethod
start /wait cmd /c "ncu -u"
start /wait cmd /c "npm install"
goto Menu

:CheckSoftware
call :CheckSoftwareMethod
goto Menu

:Host
start cmd /c "php artisan serve"
start cmd /c "npm run dev"
goto Menu

:CreateView
set /p makeView=Enter the view name (e.g., admin.users):

php artisan make:view %makeView%.index
php artisan make:view %makeView%.create
php artisan make:view %makeView%.edit
php artisan make:view %makeView%.show
goto Menu

:RegenerateComposerAutoload
call :CheckSoftwareMethod
start /wait cmd /c "composer dump-autoload"
goto Menu

:BuildToProduction
call :CheckSoftwareMethod
start /wait cmd /c "npm run build"
goto Menu

@REM Dangerous
:ResetAllCache
start /wait cmd /c "php artisan cache:clear"
start /wait cmd /c "php artisan config:clear"
start /wait cmd /c "php artisan route:clear"
start /wait cmd /c "php artisan view:clear"
start /wait cmd /c "php artisan clear-compiled"
start /wait cmd /c "php artisan optimize"
goto Menu

@REM Method
:CheckSoftwareMethod
start /wait cmd /c "check_software.bat"
exit /b
