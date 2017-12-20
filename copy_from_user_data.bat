@echo off

set user_data_dir=%USERPROFILE%\.atom

set copy_files=init.coffee ^
keymap.cson ^
styles.less
for %%i in (%copy_files%) do (
    copy /Y %user_data_dir%\%%i
)
