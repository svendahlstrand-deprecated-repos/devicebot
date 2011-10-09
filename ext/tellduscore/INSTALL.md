Install instructions
====================

OS X
----

* Install the native software: http://www.telldus.se/products/nativesoftware
* brew install swig
* swig -ruby -autorename -I/Library/Frameworks/Tellduscore.framework/Headers tellduscore.i
* ruby extconf.rb
* make
* make install

Ubuntu
------

* swig -ruby -autorename -I/usr/include tellduscore.i
* ruby extconf.rb
* make
* make install
