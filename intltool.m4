## intltool.m4 - Configure intltool for the target system. -*-Shell-script-*-
## Copyright (C) 2001 Eazel, Inc.
## Author: Maciej Stachowiak <mjs@noisehavoc.org>
##         Kenneth Christiansen <kenneth@gnu.org>
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

dnl IT_PROG_INTLTOOL([MINIMUM-VERSION], [no-xml])
# serial 1 IT_PROG_INTLTOOL
AC_DEFUN([IT_PROG_INTLTOOL],
[

if test -n "$1"; then
    AC_MSG_CHECKING(for intltool >= $1)

    INTLTOOL_REQUIRED_VERSION_AS_INT=`echo $1 | awk -F. '{ printf "%d", $[1] * 100 + $[2]; }'`
    INTLTOOL_APPLIED_VERSION=`awk -F\" '/\\$VERSION / { printf $[2]; }'  < ${ac_aux_dir}/intltool-update.in`
    changequote({{,}})
    INTLTOOL_APPLIED_VERSION_AS_INT=`awk -F\" '/\\$VERSION / { split(${{2}}, VERSION, "."); printf "%d\n", VERSION[1] * 100 + VERSION[2];}' < ${ac_aux_dir}/intltool-update.in`
    changequote([,])

    if test "$INTLTOOL_APPLIED_VERSION_AS_INT" -ge "$INTLTOOL_REQUIRED_VERSION_AS_INT"; then
	AC_MSG_RESULT([$INTLTOOL_APPLIED_VERSION found])
    else
	AC_MSG_RESULT([$INTLTOOL_APPLIED_VERSION found. Your intltool is too old.  You need intltool $1 or later.])
	exit 1
    fi
fi

  INTLTOOL_DESKTOP_RULE='%.desktop:   %.desktop.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
INTLTOOL_DIRECTORY_RULE='%.directory: %.directory.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
     INTLTOOL_KEYS_RULE='%.keys:      %.keys.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -k -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
     INTLTOOL_PROP_RULE='%.prop:      %.prop.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
      INTLTOOL_OAF_RULE='%.oaf:       %.oaf.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -o -p $(top_srcdir)/po $< [$]@'
     INTLTOOL_PONG_RULE='%.pong:      %.pong.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
   INTLTOOL_SERVER_RULE='%.server:    %.server.in    $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -o -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
    INTLTOOL_SHEET_RULE='%.sheet:     %.sheet.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
INTLTOOL_SOUNDLIST_RULE='%.soundlist: %.soundlist.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
       INTLTOOL_UI_RULE='%.ui:        %.ui.in        $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
      INTLTOOL_XML_RULE='%.xml:       %.xml.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
      INTLTOOL_XML_NOMERGE_RULE='%.xml:       %.xml.in       $(INTLTOOL_MERGE) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u /tmp $< [$]@' 
      INTLTOOL_XAM_RULE='%.xam:       %.xml.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
      INTLTOOL_KBD_RULE='%.kbd:       %.kbd.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -x -u -m -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
    INTLTOOL_CAVES_RULE='%.caves:     %.caves.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
  INTLTOOL_SCHEMAS_RULE='%.schemas:   %.schemas.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -s -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 
    INTLTOOL_THEME_RULE='%.theme:     %.theme.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; LC_ALL=C $(INTLTOOL_MERGE) -d -u -c $(top_builddir)/po/.intltool-merge-cache $(top_srcdir)/po $< [$]@' 

AC_SUBST(INTLTOOL_DESKTOP_RULE)
AC_SUBST(INTLTOOL_DIRECTORY_RULE)
AC_SUBST(INTLTOOL_KEYS_RULE)
AC_SUBST(INTLTOOL_PROP_RULE)
AC_SUBST(INTLTOOL_OAF_RULE)
AC_SUBST(INTLTOOL_PONG_RULE)
AC_SUBST(INTLTOOL_SERVER_RULE)
AC_SUBST(INTLTOOL_SHEET_RULE)
AC_SUBST(INTLTOOL_SOUNDLIST_RULE)
AC_SUBST(INTLTOOL_UI_RULE)
AC_SUBST(INTLTOOL_XAM_RULE)
AC_SUBST(INTLTOOL_KBD_RULE)
AC_SUBST(INTLTOOL_XML_RULE)
AC_SUBST(INTLTOOL_XML_NOMERGE_RULE)
AC_SUBST(INTLTOOL_CAVES_RULE)
AC_SUBST(INTLTOOL_SCHEMAS_RULE)
AC_SUBST(INTLTOOL_THEME_RULE)

# Use the tools built into the package, not the ones that are installed.

INTLTOOL_EXTRACT='$(top_builddir)/intltool-extract'
INTLTOOL_MERGE='$(top_builddir)/intltool-merge'
INTLTOOL_UPDATE='$(top_builddir)/intltool-update'

AC_SUBST(INTLTOOL_EXTRACT)
AC_SUBST(INTLTOOL_MERGE)
AC_SUBST(INTLTOOL_UPDATE)

AC_PATH_PROG(INTLTOOL_PERL, perl)
if test -z "$INTLTOOL_PERL"; then
   AC_MSG_ERROR([perl not found; required for intltool])
fi
if test -z "`$INTLTOOL_PERL -v | fgrep '5.' 2> /dev/null`"; then
   AC_MSG_ERROR([perl 5.x required for intltool])
fi
if test "x$2" != "xno-xml"; then
   AC_MSG_CHECKING([for XML::Parser])
   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
       AC_MSG_RESULT([ok])
   else
       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
   fi
fi

AC_PATH_PROG(ICONV, iconv, iconv)
AC_PATH_PROG(MSGFMT, msgfmt, msgfmt)
AC_PATH_PROG(MSGMERGE, msgmerge, msgmerge)
AC_PATH_PROG(XGETTEXT, xgettext, xgettext)

# Remove file type tags (using []) from po/POTFILES.

ifdef([AC_DIVERSION_ICMDS],[
  AC_DIVERT_PUSH(AC_DIVERSION_ICMDS)
      changequote(,)
      mv -f po/POTFILES po/POTFILES.tmp
      sed -e '/\[encoding.*\]/d' -e 's/\[.*\] *//' < po/POTFILES.tmp > po/POTFILES
      rm -f po/POTFILES.tmp
      changequote([,])
  AC_DIVERT_POP()
],[
  ifdef([AC_CONFIG_COMMANDS_PRE],[
    AC_CONFIG_COMMANDS_PRE([
        changequote(,)
        mv -f po/POTFILES po/POTFILES.tmp
        sed -e '/\[encoding.*\]/d' -e 's/\[.*\] *//' < po/POTFILES.tmp > po/POTFILES
        rm -f po/POTFILES.tmp
        changequote([,])
    ])
  ])

############################################################################
## Take this bit from AM_PROG_MKDIR_P to set mkdir_p for automake 1.4 users
############################################################################
if mkdir -p --version . >/dev/null 2>&1 && test ! -d ./--version; then
  # Keeping the `.' argument allows $(mkdir_p) to be used without
  # argument.  Indeed, we sometimes output rules like
  #   $(mkdir_p) $(somedir)
  # where $(somedir) is conditionally defined.
  # (`test -n '$(somedir)' && $(mkdir_p) $(somedir)' is a more
  # expensive solution, as it forces Make to start a sub-shell.)
  mkdir_p='mkdir -p -- .'
else
  # On NextStep and OpenStep, the `mkdir' command does not
  # recognize any option.  It will interpret all options as
  # directories to create, and then abort because `.' already
  # exists.
  for d in ./-p ./--version;
  do
    test -d $d && rmdir $d
  done
  # $(mkinstalldirs) is defined by Automake if mkinstalldirs exists.
  if test -f "$ac_aux_dir/mkinstalldirs"; then
    mkdir_p='$(mkinstalldirs)'
  else
    mkdir_p='$(install_sh) -d'
  fi
fi
AC_SUBST([mkdir_p])
])

# Manually sed perl in so people don't have to put the intltool scripts in AC_OUTPUT.

AC_CONFIG_COMMANDS([intltool], [

intltool_edit="-e 's:@INTLTOOL_EXTRACT@:`pwd`/intltool-extract:g' \
               -e 's:@INTLTOOL_ICONV@:${ICONV}:g' \
               -e 's:@INTLTOOL_MSGFMT@:${MSGFMT}:g' \
               -e 's:@INTLTOOL_MSGMERGE@:${MSGMERGE}:g' \
               -e 's:@INTLTOOL_XGETTEXT@:${XGETTEXT}:g' \
               -e 's:@INTLTOOL_PERL@:${INTLTOOL_PERL}:g'"

eval sed ${intltool_edit} < ${ac_aux_dir}/intltool-extract.in \
  > intltool-extract.out
if cmp -s intltool-extract intltool-extract.out 2>/dev/null; then
  rm -f intltool-extract.out
else
  mv -f intltool-extract.out intltool-extract
fi
chmod ugo+x intltool-extract
chmod u+w intltool-extract

eval sed ${intltool_edit} < ${ac_aux_dir}/intltool-merge.in \
  > intltool-merge.out
if cmp -s intltool-merge intltool-merge.out 2>/dev/null; then
  rm -f intltool-merge.out
else
  mv -f intltool-merge.out intltool-merge
fi
chmod ugo+x intltool-merge
chmod u+w intltool-merge

eval sed ${intltool_edit} < ${ac_aux_dir}/intltool-update.in \
  > intltool-update.out
if cmp -s intltool-update intltool-update.out 2>/dev/null; then
  rm -f intltool-update.out
else
  mv -f intltool-update.out intltool-update
fi
chmod ugo+x intltool-update
chmod u+w intltool-update

], INTLTOOL_PERL='${INTLTOOL_PERL}' ac_aux_dir=${ac_aux_dir}
INTLTOOL_EXTRACT='${INTLTOOL_EXTRACT}' ICONV='${ICONV}'
MSGFMT='${MSGFMT}' MSGMERGE='${MSGMERGE}' XGETTEXT='${XGETTEXT}')

])

# deprecated macros
AC_DEFUN([AC_PROG_INTLTOOL], [IT_PROG_INTLTOOL($@)])

