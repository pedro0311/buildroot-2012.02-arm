#############################################################
#
# automake
#
#############################################################
AUTOMAKE_VERSION = 1.11.1
AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.bz2
AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake

AUTOMAKE_DEPENDENCIES = host-autoconf autoconf microperl

HOST_AUTOMAKE_DEPENDENCIES = host-autoconf

define GTK_DOC_M4_INSTALL
 $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(TOOLCHAINS_DIR)/share/aclocal/gtk-doc.m4
endef

# ensure staging aclocal dir exists
define HOST_AUTOMAKE_MAKE_ACLOCAL
	mkdir -p $(ACLOCAL_DIR)
endef

HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))

# variables used by other packages
AUTOMAKE = $(TOOLCHAINS_DIR)/bin/automake
ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
ACLOCAL_HOST_DIR = $(TOOLCHAINS_DIR)/share/aclocal
ACLOCAL = $(TOOLCHAINS_DIR)/bin/aclocal -I $(ACLOCAL_DIR)
