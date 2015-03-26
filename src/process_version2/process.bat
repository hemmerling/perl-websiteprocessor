@echo off
rem *
rem * @package   websiteprocessor
rem * @file      process.bat
rem * @brief     Preparing local HTML files for FTP upload 
rem * @author    Rolf Hemmerling <hemmerling@gmx.net>
rem * @version   2.00, 
rem *            COMMAND.COM batch file,
rem *            target platform: Windows computers
rem * @date      2015-01-01
rem * @copyright Apache License, Version 2.0
rem * 
rem * process.bat - Preparing local HTML files for FTP upload 
rem *               HTML Link modification processing
rem *               Local site:  relative links for use with http://localhost/
rem *               Global site: relative links ( but the necessary for 
rem *                                             use with the BASE HREF feature )
rem *               Global forwarding site: absolute links to the content site,
rem *                                       relative links to self
rem *               Global content site: absolute links to the forwarding site,
rem *                                    relative links to self
rem * 
rem * Copyright 1995-2015 Rolf Hemmerling
rem * 
rem * Licensed under the Apache License, Version 2.0 (the "License");
rem * you may not use this file except in compliance with the License.
rem * You may obtain a copy of the License at
rem * 
rem * http://www.apache.org/licenses/LICENSE-2.0
rem *
rem * Unless required by applicable law or agreed to in writing,
rem * software distributed under the License is distributed on an
rem * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
rem * either express or implied.
rem * See the License for the specific language governing permissions
rem * and limitations under the License.
rem *
rem * Last updates: 2001-07-14
rem *               2008-02-04 ( "Microsoft Vista ready" )
rem *               2009-08-24 ( "htdocs" )
rem *
pushd

rem * for W2K
set copycmd=/y

set upload1=html
set project1=html
set upload2=xml
set project2=xml
set upload3=wml
set project3=wml
rem goto XX01
set project_drive=v:
set upload_drive=v:
set project_path=%project_drive%\users\public\htdocs\content
set upload_path=%upload_drive%\users\public\htdocs\content.upl
set project_dir=.
set upload_dir=.
rem *
rem * Creating the Directory structure for the CONTENT Web site
rem *
%upload_drive%
cd %upload_path%
mkdir %upload_dir%\%upload1%
mkdir %upload_dir%\%upload1%\en
mkdir %upload_dir%\%upload1%\de
mkdir %upload_dir%\%upload1%\p
mkdir %upload_dir%\%upload1%\gbook
mkdir %upload_dir%\%upload1%\jscript
rem mkdir %upload_dir%\%upload1%\cv
rem mkdir %upload_dir%\%upload1%\cv.en
rem mkdir %upload_dir%\%upload1%\cv.de
rem mkdir %upload_dir%\%upload1%\cv\fs
rem mkdir %upload_dir%\%upload1%\cv.en\fs
rem mkdir %upload_dir%\%upload1%\cv.de\fs
mkdir %upload_dir%\%upload1%\tw
mkdir %upload_dir%\%upload1%\en\n
mkdir %upload_dir%\%upload1%\de\n
mkdir %upload_dir%\%upload1%\en\s
mkdir %upload_dir%\%upload1%\de\s
mkdir %upload_dir%\%upload1%\en\fs
mkdir %upload_dir%\%upload1%\de\fs
mkdir %upload_dir%\%upload1%\p\fs
mkdir %upload_dir%\%upload1%\gbook\fs
mkdir %upload_dir%\%upload1%\errors
mkdir %upload_dir%\%upload2%
mkdir %upload_dir%\%upload2%\tm
mkdir %upload_dir%\%upload2%\jscript
mkdir %upload_dir%\%upload3%
rem mkdir %upload_dir%\%data%\
rem mkdir %upload_dir%\%data%\banners
rem mkdir %upload_dir%\%data%\banners\de
rem mkdir %upload_dir%\%data%\banners\en
rem mkdir %upload_dir%\%data%\images
rem mkdir %upload_dir%\%data%\images\de
rem mkdir %upload_dir%\%data%\images\en
rem mkdir %upload_dir%\%data%\gallery
rem mkdir %upload_dir%\%data%\gallery\de
rem mkdir %upload_dir%\%data%\gallery\en
rem mkdir %upload_dir%\%data%\expo
rem mkdir %upload_dir%\%data%\expo\de
rem mkdir %upload_dir%\%data%\expo\en
mkdir %upload_dir%\hp
mkdir %upload_dir%\hp\andreas
mkdir %upload_dir%\hp\armin
mkdir %upload_dir%\hp\bernd
mkdir %upload_dir%\hp\horst
mkdir %upload_dir%\hp\jeff
mkdir %upload_dir%\hp\john
mkdir %upload_dir%\hp\ken
mkdir %upload_dir%\hp\rolf
mkdir %upload_dir%\hp\sabine
mkdir %upload_dir%\hp\torsten

rem *
rem * Processing the files for the CONTENT Web site
rem *
%project_drive%
cd %project_path%
call replace.bat %project_path% %upload_path%
xcopy %project_path%\%project1%\*.* %upload_path%\%upload1%\.
xcopy %project_path%\fs\*.* %upload_path%\fs\.
call replace.bat %project_path%\%project1%\en %upload_path%\%upload1%\en
call replace.bat %project_path%\%project1%\en\s %upload_path%\%upload1%\en\s
call replace.bat %project_path%\%project1%\en\n %upload_path%\%upload1%\en\n
xcopy %project_path%\%project1%\en\fs\*.* %upload_path%\%upload1%\en\fs\.
call replace.bat %project_path%\%project1%\de %upload_path%\%upload1%\de
call replace.bat %project_path%\%project1%\de\s %upload_path%\%upload1%\de\s
call replace.bat %project_path%\%project1%\de\n %upload_path%\%upload1%\de\n
xcopy %project_path%\%project1%\de\fs\*.* %upload_path%\%upload1%\de\fs\.
call replace.bat %project_path%\%project1%\p %upload_path%\%upload1%\p
xcopy %project_path%\%project1%\p\fs\*.* %upload_path%\%upload1%\p\fs\.
call replace.bat %project_path%\%project1%\errors %upload_path%\%upload1%\errors
call replace.bat %project_path%\%project1%\gbook %upload_path%\%upload1%\gbook
xcopy %project_path%\%project1%\gbook\fs\*.* %upload_path%\%upload1%\gbook\fs\.
call replace.bat %project_path%\%project1%\jscript %upload_path%\%upload1%\jscript
xcopy %project_path%\%project2%\*.* %upload_path%\%upload2%\.
call replace.bat %project_path%\%project1%\tw %upload_path%\%upload1%\tw
call replace.bat %project_path%\%project3% %upload_path%\%upload3%
rem *
rem call replace.bat %project_path%\%project1%\cv %upload_path%\%upload1%\cv
rem call replace.bat %project_path%\%project1%\cv.en %upload_path%\%upload1%\cv.en
rem call replace.bat %project_path%\%project1%\cv.de %upload_path%\%upload1%\cv.de
rem xcopy %project_path%\%project1%\cv\fs\*.* %upload_path%\%upload1%\cv\fs\.
rem xcopy %project_path%\%project1%\cv.en\fs\*.* %upload_path%\%upload1%\cv.en\fs\.
rem xcopy %project_path%\%project1%\cv.de\fs\*.* %upload_path%\%upload1%\cv.de\fs\.
xcopy %project_path%\htdocs\*.* %upload_path%\htdocs\. /E
call replace.bat %project_path%\%project2%\tm %upload_path%\%upload2%\tm
call replace.bat %project_path%\%project2%\jscript %upload_path%\%upload2%\jscript
call replace.bat %project_path%\%project3% %upload_path%\%upload3%
goto XX00

:XX01
set project_drive=v:
set upload_drive=v:
set project_path=%project_drive%\users\public\htdocs\forward
set upload_path=%upload_drive%\users\public\htdocs\forward.upl
set project_dir=.
set upload_dir=.
rem *
rem * Creating the Directory structure for Hemmerling.Com
rem *
%upload_drive%
cd %upload_path%
mkdir %upload_dir%\%upload1%
mkdir %upload_dir%\%upload1%\en
mkdir %upload_dir%\%upload1%\de
mkdir %upload_dir%\%upload1%\p
rem jscript is not used here
rem mkdir %upload_dir%\%upload1%\gbook
rem mkdir %upload_dir%\%upload1%\cv
rem mkdir %upload_dir%\%upload1%\cv.en
rem mkdir %upload_dir%\%upload1%\cv.de
rem mkdir %upload_dir%\%upload1%\cv\fs
rem mkdir %upload_dir%\%upload1%\cv.en\fs
rem mkdir %upload_dir%\%upload1%\cv.de\fs
mkdir %upload_dir%\%upload1%\tw
mkdir %upload_dir%\%upload1%\en\n
mkdir %upload_dir%\%upload1%\de\n
mkdir %upload_dir%\%upload1%\en\s
mkdir %upload_dir%\%upload1%\de\s
mkdir %upload_dir%\%upload1%\en\fs
mkdir %upload_dir%\%upload1%\de\fs
mkdir %upload_dir%\%upload1%\p\fs
rem mkdir %upload_dir%\%upload1%\gbook\fs
mkdir %upload_dir%\%upload1%\errors
mkdir %upload_dir%\htdocs
mkdir %upload_dir%\htdocs\andreas
mkdir %upload_dir%\htdocs\armin
mkdir %upload_dir%\htdocs\bernd
mkdir %upload_dir%\htdocs\horst
mkdir %upload_dir%\htdocs\jeff
mkdir %upload_dir%\htdocs\john
mkdir %upload_dir%\htdocs\ken
mkdir %upload_dir%\htdocs\rolf
mkdir %upload_dir%\htdocs\sabine
mkdir %upload_dir%\htdocs\torsten
mkdir %upload_dir%\%upload2%\tm
rem jscript is not used here

rem *
rem * Processing the files for Hemmerling.Com
rem *
%project_drive%
cd %project_path%
call replace.bat %project_path% %upload_path%
xcopy %project_path%\fs\*.* %upload_path%\fs\.
xcopy %project_path%\%project1%\*.* %upload_path%\%upload1%\.
call replace.bat %project_path%\%project1%\en %upload_path%\%upload1%\en
call replace.bat %project_path%\%project1%\en\n %upload_path%\%upload1%\en\n
call replace.bat %project_path%\%project1%\en\s %upload_path%\%upload1%\en\s
xcopy %project_path%\%project1%\en\fs\*.* %upload_path%\%upload1%\en\fs\. /E
call replace.bat %project_path%\%project1%\de %upload_path%\%upload1%\de
call replace.bat %project_path%\%project1%\de\n %upload_path%\%upload1%\de\n
call replace.bat %project_path%\%project1%\de\s %upload_path%\%upload1%\de\s
xcopy %project_path%\%project1%\de\fs\*.* %upload_path%\%upload1%\de\fs\. /E
call replace.bat %project_path%\%project1%\p %upload_path%\%upload1%\p
xcopy %project_path%\%project1%\p\fs\*.* %upload_path%\%upload1%\p\fs\.
call replace.bat %project_path%\%project1%\errors %upload_path%\%upload1%\errors
rem call replace.bat %project_path%\%project1%\gbook %upload_path%\%upload1%\gbook
rem xcopy %project_path%\%project1%\gbook\fs\*.* %upload_path%\%upload1%\gbook\fs\.
call replace.bat %project_path%\%project1%\tw %upload_path%\%upload1%\tw
call replace.bat %project_path%\%project1%\cv %upload_path%\%upload1%\cv
call replace.bat %project_path%\%project1%\cv.en %upload_path%\%upload1%\cv.en
call replace.bat %project_path%\%project1%\cv.de %upload_path%\%upload1%\cv.de
xcopy %project_path%\%project1%\cv\fs\*.* %upload_path%\%upload1%\cv\fs\.
xcopy %project_path%\%project1%\cv.en\fs\*.* %upload_path%\%upload1%\cv.en\fs\.
xcopy %project_path%\%project1%\cv.de\fs\*.* %upload_path%\%upload1%\cv.de\fs\.
xcopy %project_path%\htdocs\*.* %upload_path%\htdocs\ /E
rem jscript is not used here
xcopy %project_path%\%project2%\*.* %upload_path%\%upload2%\.
call replace.bat %project_path%\%project2%\tm %upload_path%\%upload2%\tm

:XX00
popd

rem *
rem * end
rem *
