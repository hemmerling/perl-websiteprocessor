#!/usr/local/bin/perl
use strict;
use cwd;

#
# @package   websiteprocessor
# @file      replace.pl
# @brief     Preparing local HTML files for FTP upload 
# @author    Rolf Hemmerling <hemmerling@gmx.net>
# @version   2.00, 
#            Perl 5.x,
#            target platform: Windows computers
# @date      2015-01-01
# @copyright Apache License, Version 2.0
# 
# replace.pl - Preparing local HTML files for FTP upload 
#              HTML Link modification processing
#              Local site:  relative links for use with http://localhost/
#              Global site: relative links ( but the necessary for 
#                                            use with the BASE HREF feature )
#              Global forwarding site: absolute links to the content site, 
#                                      relative links to self
#              Global content site: absolute links to the forwarding site, 
#                                   relative links to self
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
# Last update: 2000-03-15, 2008-02-04
#
my $dot = "\056";
my $colon = "\072";
#
# Database with original and replacement strings
#
#  Remember: the string order is important
#            if you look for ../../../ and for ../../../../
#            you must try to replace ../../../../ first !
#
my @GV_content_url = (
              # Instructions for the Hemmerling.Com WEB Site
              "$dot$dot/$dot$dot/$dot$dot/$dot$dot/content/html/", #1
              "$dot$dot/$dot$dot/$dot$dot/content/html/", #2
              "$dot$dot/$dot$dot/$dot$dot/content/", #3
              # Anweisungen fr Content WEB Site:
              # absolute URL
              "http://localhost/content/html/", #4
              "http://localhost/content/", #5
              # absolute URL
              "$dot$dot/content/" #6
            );

my @GV_content_replacement_url = (
              # Instructions for the Hemmerling.Com WEB Site:
              "html/", #1
              "html/", #2
              "", #3
              # Instructions for the Content WEB Site:
              "html/", #4
              "", #5
              # absolute URL
              "", #6
            );

my @GV_forward_url = (
              # Instructions for the Content WEB Site:
              "$dot$dot/$dot$dot/$dot$dot/$dot$dot/forward/html/", #1
              "$dot$dot/$dot$dot/$dot$dot/forward/html/", #2
              "$dot$dot/$dot$dot/$dot$dot/forward/", #3
              # absolute URLs
              "http://localhost/users/public/hp/forward/html/",#4
              "http://localhost/users/public/hp/forward/",#5
              "$dot$dot/forward/" #6
            );

my @GV_forward_replacement_url = (
              # Instructions for the Content WEB Site:
              "html/", #1
              "html/", #2
              "", #3
              # Absolute URLs for the BASE HREF Feature
              "html/", #4
              "/", #5
              "" #6
            );

my @GV_counter_url = (
              # Instructions for the Content WEB Site:
              "$dot$dot/$dot$dot/$dot$dot/$dot$dot/counter/html/", #1
              "$dot$dot/counter/" #2
            );

my @GV_counter_replacement_url = (
              # Instructions for the Content WEB Site:
              "html/", #1
              "" #2
            );

my $GV_target1 = "http://www.hemmerling.com/";
my $GV_target2 = "http://www.hemmerling.f2s.com/";
my $GV_target3 = "http://home.germany.net/forwardng/";
my $GV_forward_domain = $GV_target1;
my $GV_content_domain = $GV_target2;
my $GV_counter_domain = $GV_target3;
                                                                                               #
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
      my $PV_replacement_url = $GV_content_domain . $GV_content_replacement_url[$LV_ii];

      if ( $PV_line =~ s/$PV_local_url/$PV_replacement_url/g )
       {
         # print "-->",$PV_line;
       };

    };
   foreach $LV_ii (0..$#GV_forward_url)
    {
      my $PV_local_url = $GV_forward_url[$LV_ii];
      my $PV_replacement_url = $GV_forward_domain . $GV_forward_replacement_url[$LV_ii];

      if ( $PV_line =~ s/$PV_local_url/$PV_replacement_url/g )
       {
         # print "-->",$PV_line;
       };
    };
   foreach $LV_ii (0..$#GV_counter_url)
    {
      my $PV_local_url = $GV_counter_url[$LV_ii];
      my $PV_replacement_url = $GV_counter_domain . $GV_counter_replacement_url[$LV_ii];

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
