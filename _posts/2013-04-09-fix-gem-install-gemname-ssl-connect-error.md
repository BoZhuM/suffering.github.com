---
layout: post
title: "fix gem install `gemname` SSL connect ERROR"
description: ""
category: 
tags: []
---
{% include JB/setup %}

when running `bundle install` I met a error:

    OpenSSL::SSL::SSLError: SSL_connect returned=6 errno=0 state=SSLv3 read finished A
    An error occurred while installing multi_json (1.7.2), and Bundler cannot
    continue.
    Make sure that `gem install multi_json -v '1.7.2'` succeeds before bundling.

To fix it, run command in bash:

    export SSL_CERT_FILE=/etc/pki/tls/cert.pem

> That sometimes happens if the default 'OpenSSL directory' is not set correctly with the native OpenSSL library. open-uri uses OpenSSL::X509::Store#set_default_paths in order to tell OpenSSL to look in the OpenSSL directory for the file that contains the trusted root certificates that OpenSSL trusts by default.

> In your case, this lookup fails. You can make it succeed by setting an environment variable that overrides the default setting and tells OpenSSL to look in that directory instead:

> export SSL_CERT_FILE=/etc/pki/tls/cert.pem

> That's the default location for the root CA bundle on my Fedora 16 64 bit, other popular locations are /etc/ssl/ca-bundle.crt etc. In your case, the OpenSSL library used by RVM is located in $rvm_path/usr, so you should look around there for a suitable candidate for the default root CA file. After the environment variable is set correctly, the call to open-uri will succeed.

> To make the environment variable permanent, use the usual ways such as defining the export in .bashrc, /etc/profile or whatever fits best in your situation.

Done!

references: <http://stackoverflow.com/questions/10728436/opensslsslsslerror-ssl-connect-returned-1-errno-0-state-sslv3-read-server-c>