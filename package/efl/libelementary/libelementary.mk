################################################################################
#
# libelementary
#
################################################################################

LIBELEMENTARY_VERSION = 0.8.0.65643
LIBELEMENTARY_SOURCE = elementary-$(LIBELEMENTARY_VERSION).tar.bz2
LIBELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2011-11-28
LIBELEMENTARY_INSTALL_STAGING = YES

LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
				host-libeet

LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(TOOLCHAINS_DIR)/bin/edje_cc \
			 --with-eet-eet=$(TOOLCHAINS_DIR)/bin/eet

$(eval $(call AUTOTARGETS))
