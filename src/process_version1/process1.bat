@echo off
rem *
rem * @package   websiteprocessor
rem * @file      process1.bat
rem * @brief     Preparing local HTML files for FTP upload 
rem * @author    Rolf Hemmerling <hemmerling@gmx.net>
rem * @version   1.00, 
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
rem * Last updates: 2000-10-26
rem *               2008-02-04 ( "Microsoft Vista ready" )
rem *
pushd

set upload1=html
set project1=html
set upload2=xml
set project2=xml
set project_drive=v:
set upload_drive=v:
set project_path=%project_drive%\users\public\hp\content
set upload_path=%upload_drive%\users\public\hp\content.upl
set project_dir=.
set upload_dir=.

rem *
rem * Processing the files for the CONTENT Web site
rem *
%project_drive%
cd %project_path%
rem These calls are now obselete
rem call replace1.bat %project_path%\ %upload_path%\
rem call replace1.bat %project_path%\%project1%\p %upload_path%\%upload1%\p
rem call replace1.bat %project_path%\%project1%\en %upload_path%\%upload1%\en
rem call replace1.bat %project_path%\%project1%\de %upload_path%\%upload1%\de
rem call replace1.bat %project_path%\%project1%\en\n %upload_path%\%upload1%\en\n
rem call replace1.bat %project_path%\%project1%\de\n %upload_path%\%upload1%\de\n
rem call replace1.bat %project_path%\%project1%\en\s %upload_path%\%upload1%\en\s
rem call replace1.bat %project_path%\%project1%\de\s %upload_path%\%upload1%\de\s
rem call replace1.bat %project_path%\%project1%\jsscript %upload_path%\%upload1%\jsscript
rem call replace1.bat %project_path%\%project1%\errors %upload_path%\%upload1%\errors
rem call replace1.bat %project_path%\%project1%\tw %upload_path%\%upload1%\tw
rem call replace1.bat %project_path%\%project1%\resume %upload_path%\%upload1%\resume
rem call replace1.bat %project_path%\%project1%\resume.de %upload_path%\%upload1%\resume.de
rem call replace1.bat %project_path%\%project1%\resume.en %upload_path%\%upload1%\resume.en
rem call replace1.bat %project_path%\%project1%\gbook %upload_path%\%upload1%\gbook

:XX00
popd

rem *
rem * end
rem *
