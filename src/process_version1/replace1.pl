#!/usr/local/bin/perl
use strict;
use cwd;

#
# @package   websiteprocessor
# @file      replace1.pl
# @brief     Preparing local HTML files for FTP upload 
# @author    Rolf Hemmerling <hemmerling@gmx.net>
# @version   1.00, 
#            Perl 5.x,
#            target platform: Windows computers
# @date      2015-01-01
# @copyright Apache License, Version 2.0
# 
# replace1.pl - Preparing local HTML files for FTP upload 
#               HTML Link modification processing
#               Local site:  relative links for use with http://localhost/
#               Global site: relative links ( but the necessary for 
#                                             use with the BASE HREF feature )
#               Global forwarding site: absolute links to the content site, 
#                                       relative links to self
#               Global content site: absolute links to the forwarding site, 
#                                    relative links to self
# 
# Copyright 1995-2015 Rolf Hemmerling
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# Last update: 2000-03-15
#
my $dot = "\056";
my $colon = "\072";
my $at = "\@";
#
# Database with original and replacement strings
#
my @GV_content_001 = (
              # Instructions for Webring banners
              ";sprev", #1
              ";prev", #2
              ";next", #3
              ";skip", #4
              ";random", #5
              ";home", #6
              ";addsite", #7
              ";edit", #8
              ";list", #9
              # Instructions for Webring management
              ";go", #10
              ";page", #11
              ";manring", #12
              ";arrange", #13
              ";ring", #14
              ";showpage", #15
              ";manqueue", #16
              ";action=redirect" #17
            );

my @GV_content_replacement_001 = (
              # Instructions for Webrings
              "\&amp;sprev", #1
              "\&amp;prev", #2
              "\&amp;next", #3
              "\&amp;skip", #4
              "\&amp;random", #5
              "\&amp;home", #6
              "\&amp;addsite", #7
              "\&amp;edit", #8
              "\&amp;list", #9
              # Instructions for Webring management
              "\&amp;go", #10
              "\&amp;page", #11
              "\&amp;manring", #12
              "\&amp;arrange", #13
              "\&amp;ring", #14
              "\&amp;showpage", #15
              "\&amp;manqueue", #16
              "\&amp;action=redirect" #17
            );

my @GV_content_url = (
              "hemmerling" . $at . "geocities.com",
              "hemmerling" . $at . "geocities.com"
            );

my @GV_content_replacement_url = (
              "hemmerling" . $at . "gmx.net",
              "hemmerling" . $at . "gmx.net"
            );

# GP_replace
# 1.parameter = line to be processed
#
sub GP_replace
 {
   my $PV_line = $_[0];
   my $LV_ii = 0;
   foreach $LV_ii (0..$#GV_content_url)
    {
      my $PV_local_url = $GV_content_url[$LV_ii];
      my $PV_replacement_url = $GV_content_replacement_url[$LV_ii];
      # print "-->",$PV_replacement_url;

      if ( $PV_line =~ s/$PV_local_url/$PV_replacement_url/g )
       {
         # print "-->",$PV_line;
       };

    };
   print $PV_line;
 };


#
# main loop
#
sub GP_main
 {
   while (<STDIN>)
    {
      &GP_replace($_);
    };

 };

#
# main
#

GP_main();
exit(0);

#
# end of file
#
__END__

        /    /   /  Alone on the data highway...
      /        /    like on an allee in Hannover-Herrenhausen
    /    /   /      The Hemmerling (TM) WEB site
  /        /        Rolf Hemmerling, Germany
/    /   /          http://www.hemmerling.com/
