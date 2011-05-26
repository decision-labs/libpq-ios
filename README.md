libpq iOS
=========

[libpq](http://www.postgresql.org/docs/current/interactive/libpq.html) is a set of library functions that allow client programs to pass queries to the [PostgreSQL](http://www.postgresql.org/) backend server and to receive the results of these queries. 

This repository allows you to easily integrate libpq into your iOS application.

Getting Started
===============

libpq has no external dependencies apart from `libssl.a` and `libcrypto.a` which are included together with the `build-libssl.sh` script to download and compile them yourself. So getting started is easy:

* If you haven't already done so, set up your iPhone development environment by following the [iPhone Dev Center Getting Started Documents](https://developer.apple.com/iphone/index.action).

* Install [Git](http://git-scm.com/).

* Pull this repo from GitHub: ```git clone git://github.com/spacialdb/libpq-ios.git```

Licenses
========

PostgreSQL is released under the [PostgreSQL](http://www.opensource.org/licenses/postgresql) License, a liberal Open Source license, similar to the BSD or MIT licenses. See the COPYRIGHT file.

The [OpenSSL](http://www.openssl.org/) toolkit stays under a dual license, i.e. both the conditions of the OpenSSL License and the original SSLeay license apply to the toolkit. See the LICENSE file for the actual license texts.

