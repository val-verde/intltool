## intltool.m4 - Configure intltool for the target system. -*-Shell-script-*-
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

dnl AC_PROG_INTLTOOL([MINIMUM-VERSION])
# serial 1 AC_PROG_INTLTOOL
AC_DEFUN(AC_PROG_INTLTOOL,
[

INTLTOOL_DESKTOP_RULE=  '%.desktop:   %.desktop.in   $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -d -u'
INTLTOOL_DIRECTORY_RULE='%.directory: %.directory.in $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -d -u'
INTLTOOL_KEYS_RULE=     '%.keys:      %.keys.in      $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -k -u'
INTLTOOL_OAF_RULE=      '%.oaf:       %.oaf.in       $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -o -p'
INTLTOOL_PONG_RULE=     '%.pong:      %.pong.in      $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -x -u'
INTLTOOL_SERVER_RULE=   '%.server:    %.server.in    $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -o -u'
INTLTOOL_SHEET_RULE=    '%.sheet:     %.sheet.in     $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -x -u'
INTLTOOL_SOUNDLIST_RULE='%.soundlist: %.soundlist.in $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -d -u'
INTLTOOL_XML_RULE=      '%.xml:       %.xml.in       $(top_builddir)/intltool-merge $(wildcard $(top_srcdir)/po/*.po) ; $(top_builddir)/intltool-merge $(top_srcdir)/po $< [$]@ -x -u'

AC_SUBST(INTLTOOL_DESKTOP_RULE)
AC_SUBST(INTLTOOL_DIRECTORY_RULE)
AC_SUBST(INTLTOOL_KEYS_RULE)
AC_SUBST(INTLTOOL_OAF_RULE)
AC_SUBST(INTLTOOL_PONG_RULE)
AC_SUBST(INTLTOOL_SERVER_RULE)
AC_SUBST(INTLTOOL_SHEET_RULE)
AC_SUBST(INTLTOOL_SOUNDLIST_RULE)
AC_SUBST(INTLTOOL_XML_RULE)

# Use the tools built into the package, not the ones that are installed.

INTLTOOL_EXTRACT='$(top_builddir)/intltool-extract'
INTLTOOL_MERGE='$(top_builddir)/intltool-merge'
INTLTOOL_UPDATE='$(top_builddir)/intltool-update'

AC_SUBST(INTLTOOL_EXTRACT)dnl
AC_SUBST(INTLTOOL_MERGE)dnl
AC_SUBST(INTLTOOL_UPDATE)dnl

AC_PATH_PROG(INTLTOOL_PERL, perl)
if test -z "$INTLTOOL_PERL"; then
   AC_MSG_ERROR([perl not found; required for intltool])
fi
if test -z "`$INTLTOOL_PERL -v | fgrep '5.' 2> /dev/null`"; then
   AC_MSG_ERROR([perl 5.x required for intltool])
fi

dnl manually sed perl in so people don't have to put the intltool scripts in AC_OUTPUT

AC_OUTPUT_COMMANDS([

sed -e "s:@INTLTOOL_PERL@:${INTLTOOL_PERL}:;" < ${srcdir}/intltool-extract.in > intltool-extract.out
if cmp -s intltool-extract intltool-extract.out 2>/dev/null; then
  rm -f intltool-extract.out
else
  mv -f intltool-extract.out intltool-extract
fi
chmod ugo+x intltool-extract
chmod u+w intltool-extract

sed -e "s:@INTLTOOL_PERL@:${INTLTOOL_PERL}:;" < ${srcdir}/intltool-merge.in > intltool-merge.out
if cmp -s intltool-merge intltool-merge.out 2>/dev/null; then
  rm -f intltool-merge.out
else
  mv -f intltool-merge.out intltool-merge
fi
chmod ugo+x intltool-merge
chmod u+w intltool-merge

sed -e "s:@INTLTOOL_PERL@:${INTLTOOL_PERL}:;" < ${srcdir}/intltool-update.in > intltool-update.out
if cmp -s intltool-update intltool-update.out 2>/dev/null; then
  rm -f intltool-update.out
else
  mv -f intltool-update.out intltool-update
fi
chmod ugo+x intltool-update
chmod u+w intltool-update
], INTLTOOL_PERL=${INTLTOOL_PERL})

])
