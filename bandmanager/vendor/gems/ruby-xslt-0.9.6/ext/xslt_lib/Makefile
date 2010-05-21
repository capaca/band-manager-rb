
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /usr/lib64/ruby/1.8/x86_64-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
prefix = $(DESTDIR)/usr
exec_prefix = $(DESTDIR)/usr
sitedir = $(DESTDIR)/usr/lib/ruby/site_ruby
rubylibdir = $(prefix)/lib/ruby/$(ruby_version)
archdir = $(libdir)/ruby/$(ruby_version)/$(arch)
sbindir = $(DESTDIR)/usr/sbin
datadir = $(DESTDIR)/usr/share
includedir = $(DESTDIR)/usr/include
infodir = $(DESTDIR)/usr/share/info
sysconfdir = $(DESTDIR)/etc
mandir = $(DESTDIR)/usr/share/man
libdir = $(DESTDIR)/usr/lib64
sharedstatedir = $(DESTDIR)/usr/com
oldincludedir = $(DESTDIR)/usr/include
sitearchdir = $(_fc_sitedir)/$(ruby_version)/$(sitearch)
bindir = $(DESTDIR)/usr/bin
localstatedir = $(DESTDIR)/var
sitelibdir = $(sitedir)/$(ruby_version)
libexecdir = $(DESTDIR)/usr/libexec
_fc_sitedir = $(DESTDIR)/usr/lib64/ruby/site_ruby

CC = gcc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = extconf.h
CFLAGS   =  -fPIC -g -Wall -I/usr/include/libxml2 -I/usr/include/libxml2 -O2 -g -m64 -mtune=generic -Wall  -fPIC -DUSE_ERROR_HANDLER -DUSE_EXSLT 
INCFLAGS = -I. -I. -I/usr/lib64/ruby/1.8/x86_64-linux -I.
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\"  
CXXFLAGS = $(CFLAGS) 
DLDFLAGS =   
LDSHARED = $(CC) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby
RUBY_SO_NAME = ruby
arch = x86_64-linux
sitearch = x86_64-linux
ruby_version = 1.8
ruby = /usr/bin/ruby
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = $(libdir)
LIBPATH =  -L$(libdir)
DEFFILE = 

CLEANFILES = 
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = /xml
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED) -lexslt -lxslt -lxml2  -lpthread -ldl -lcrypt -lm   -lc
SRCS = extfunc.c rb_utils.c xslt_lib.c parser.c parameters.c
OBJS = extfunc.o rb_utils.o xslt_lib.o parser.o parameters.o
TARGET = xslt_lib
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /home/storage/e/d7/a4/violatorthrash/rails_apps/bandmanager/vendor/gems/ruby-xslt-0.9.6/lib$(target_prefix)
RUBYARCHDIR = /home/storage/e/d7/a4/violatorthrash/rails_apps/bandmanager/vendor/gems/ruby-xslt-0.9.6/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS)
	@-$(RM) $@
	$(LDSHARED) $(DLDFLAGS) $(LIBPATH) -o $@ $(OBJS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h $(RUBY_EXTCONF_H)
