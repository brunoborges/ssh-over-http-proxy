ssh-over-http-proxy
===================

Originally from: http://www.zeitoun.net/articles/ssh-through-http-proxy/start

# Configure the client

I suppose you are on a Linux system (debian for example). First you have to compile the connect binary which will help your ssh client to use proxies (HTTPS in our case). Then you have to configure your ssh client to tell him to use HTTPS proxy when he tries to connect to your ssh server.

1. Install the connect software :

* On debian system, just install the connect-proxy package :

  $ sudo apt-get install connect-proxy

* On other Linux systems, you have to compile it :

  $ cd /tmp/

  $ wget http://www.meadowy.org/~gotoh/ssh/connect.c

  $ gcc connect.c -o connect

  $ sudo cp connect /usr/local/bin/ ; chmod +x /usr/local/bin/connect

2. Configure your ssh client. Open or create your ~/.ssh/config file and add these lines :

   ## Outside of the firewall, with HTTPS proxy
   Host my-ssh-server-host.net
     ProxyCommand connect -H proxy.free.fr:3128 %h 443
   ## Inside the firewall (do not use proxy)
   Host *
      ProxyCommand connect %h %p

Then pray and test the connection :

   $ ssh my-ssh-server-host.net
