## xml-i18n-tools.m4 - Configure xml-i18n-tools for the target system. -*-Shell-script-*-
## Copyright (C) 2001 Eazel, Inc.
## Author: Maciej Stachowiak <mjs@eazel.com>
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
##
## As a special exception to the GNU General Public License, if you
## distribute this file as part of a program that contains a
## configuration script generated by Autoconf, you may include it under
## the same distribution terms that you use for the rest of that program.

define([HACK_SUBST], defn([AC_SUBST]))

AC_DEFUN(XML_I18N_TOOLS_NEWER_THAN_0_9,[ true ])

dnl AC_PROG_XML_I18N_TOOLS([MINIMUM-VERSION [,"G2" if always using --utf8] ])
# serial 1 AC_PROG_XML_I18N_TOOLS
AC_DEFUN(AC_PROG_XML_I18N_TOOLS,
[
  AC_DEFUN(X18T_PFORG1,  dnl and -u for G2
        ifelse([$2],[G2],[ -u ], [ -p ]))
  AC_DEFUN(X18T_XML_KIND, 
        ifelse([$2],[G2],[ -u ],[ $(XML_I18N_XML_KIND) ]))
  AC_DEFUN(X18T_KEYS_KIND, 
        ifelse([$2],[G2],[ -u ],[ $(XML_I18N_KEYS_KIND) ]))

dnl This is a hack - we use the expansion of AC_SUBST instead of
dnl AC_SUBST itself to avoid automake putting 
dnl XML_I18N_MERGE_OAF_RULE = @XML_I18N_MERGE_OAF_RULE@
dnl in all the Makefile.in's, because that will blow up when substituted.
XML_I18N_MERGE_OAF_RULE='\%.oaf : \%.oaf.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -o -p $(top_srcdir)/po $< [$]*.oaf'
HACK_SUBST(XML_I18N_MERGE_OAF_RULE)

XML_I18N_MERGE_SERVER_RULE='\%.server : \%.server.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -o -u $(top_srcdir)/po $< [$]*.server'
HACK_SUBST(XML_I18N_MERGE_SERVER_RULE)

XML_I18N_MERGE_KEYS_RULE='\%.keys : \%.keys.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -k X18T_KEYS_KIND $(top_srcdir)/po $< [$]*.keys'
HACK_SUBST(XML_I18N_MERGE_KEYS_RULE)

XML_I18N_MERGE_DESKTOP_RULE='\%.desktop : \%.desktop.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -d X18T_PFORG1 $(top_srcdir)/po $< [$]*.desktop'
HACK_SUBST(XML_I18N_MERGE_DESKTOP_RULE)

XML_I18N_MERGE_DIRECTORY_RULE='\%.directory : \%.directory.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -d X18T_PFORG1 $(top_srcdir)/po $< [$]*.directory'
HACK_SUBST(XML_I18N_MERGE_DIRECTORY_RULE)

XML_I18N_MERGE_SOUNDLIST_RULE='\%.soundlist : \%.soundlist.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -d X18T_PFORG1 $(top_srcdir)/po $< [$]*.soundlist'
HACK_SUBST(XML_I18N_MERGE_SOUNDLIST_RULE)

XML_I18N_MERGE_PONG_RULE='\%.pong : \%.pong.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -x X18T_PFORG1 $(top_srcdir)/po $< [$]*.pong'
HACK_SUBST(XML_I18N_MERGE_PONG_RULE)

XML_I18N_MERGE_XML_RULE='\%.xml : \%.xml.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -x X18T_XML_KIND $(top_srcdir)/po $< [$]*.xml'
HACK_SUBST(XML_I18N_MERGE_XML_RULE)

XML_I18N_MERGE_SHEET_RULE='\%.sheet : \%.sheet.in $(top_builddir)/xml-i18n-merge $(top_srcdir)/po/*.po ; $(top_builddir)/xml-i18n-merge -x -u $(top_srcdir)/po $< [$]*.sheet'
HACK_SUBST(XML_I18N_MERGE_SHEET_RULE)


# Always use our own xml-i18n-tools.
XML_I18N_EXTRACT='$(top_builddir)/xml-i18n-extract'
AC_SUBST(XML_I18N_EXTRACT)dnl

XML_I18N_MERGE='$(top_builddir)/xml-i18n-merge'
AC_SUBST(XML_I18N_MERGE)dnl

XML_I18N_UPDATE='$(top_builddir)/xml-i18n-update'
AC_SUBST(XML_I18N_UPDATE)dnl

AC_PATH_PROG(XML_I18N_TOOLS_PERL, perl)
if test -z "$XML_I18N_TOOLS_PERL"; then
   AC_MSG_ERROR([perl not found; required for xml-i18n-tools])
fi
if test -z "`$XML_I18N_TOOLS_PERL -v | fgrep '5.' 2> /dev/null`"; then
   AC_MSG_ERROR([perl 5.x required for xml-i18n-tools])
fi

dnl  manually sed perl in so people don't have to put the xml-i18n-tools scripts in their 
dnl  AC_OUTPUT
AC_OUTPUT_COMMANDS([
sed -e "s:@XML_I18N_TOOLS_PERL@:${XML_I18N_TOOLS_PERL}:;" < ${srcdir}/xml-i18n-extract.in > xml-i18n-extract.out
if cmp -s xml-i18n-extract xml-i18n-extract.out 2>/dev/null; then
  rm -f xml-i18n-extract.out
else
  mv -f xml-i18n-extract.out xml-i18n-extract
fi
chmod ugo+x xml-i18n-extract
chmod u+w xml-i18n-extract

sed -e "s:@XML_I18N_TOOLS_PERL@:${XML_I18N_TOOLS_PERL}:;" < ${srcdir}/xml-i18n-merge.in > xml-i18n-merge.out
if cmp -s xml-i18n-merge xml-i18n-merge.out 2>/dev/null; then
  rm -f xml-i18n-merge.out
else
  mv -f xml-i18n-merge.out xml-i18n-merge
fi
chmod ugo+x xml-i18n-merge
chmod u+w xml-i18n-merge

sed -e "s:@XML_I18N_TOOLS_PERL@:${XML_I18N_TOOLS_PERL}:;" < ${srcdir}/xml-i18n-update.in > xml-i18n-update.out
if cmp -s xml-i18n-update xml-i18n-update.out 2>/dev/null; then
  rm -f xml-i18n-update.out
else
  mv -f xml-i18n-update.out xml-i18n-update
fi
chmod ugo+x xml-i18n-update
chmod u+w xml-i18n-update
], XML_I18N_TOOLS_PERL=${XML_I18N_TOOLS_PERL})

# Redirect the config.log output again, so that the ltconfig log is not
# clobbered by the next message.
exec 5>>./config.log
])

dnl old names
AC_DEFUN(AM_PROG_XML_I18N_TOOLS, [indir([AC_PROG_XML_I18N_TOOLS])])dnl
