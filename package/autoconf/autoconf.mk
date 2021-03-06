#############################################################
#
# autoconf
#
#############################################################
AUTOCONF_VERSION = 2.65
AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf

AUTOCONF_CONF_ENV = EMACS="no" ac_cv_path_M4=$(TOOLCHAINS_DIR)/bin/m4 \
		    ac_cv_prog_gnu_m4_gnu=no

AUTOCONF_DEPENDENCIES = microperl host-m4

HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(TOOLCHAINS_DIR)/bin/m4 \
			ac_cv_prog_gnu_m4_gnu=no

HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))

# variables used by other packages
AUTOCONF:=$(TOOLCHAINS_DIR)/bin/autoconf
AUTOHEADER:=$(TOOLCHAINS_DIR)/bin/autoheader
AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(TOOLCHAINS_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
