require 'mkmf'

if RUBY_PLATFORM =~ /darwin/
  $LDFLAGS << ' -framework TelldusCore'
  find_header('telldus-core.h', '/Library/Frameworks/Tellduscore.framework/Headers/')
else
  have_header('telldus-core.h')
  have_library('telldus-core')
end

create_makefile('tellduscore')