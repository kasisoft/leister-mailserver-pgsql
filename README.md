# Purpose 

This package contains changes necessary to use PostgreSql rather than Mysql. 
It is based upon the following installation tutorial:

* https://thomas-leister.de/mailserver-debian-buster/

__DISCLAIMER__: Take this data with a grain of salt. If you don't know what you're doing, don't to it !!!
Since I haven't tried to install a mailserver again it's possibly that some information might have slipped although I don't believe so.


## Folders

* ./dovecot - changes for the dovecot installation
* ./postfix - changes for the postfix installation
* ./setup-db - sql scripts for the database setup. for postgres user you need to invoke _psql_ rather _mysql_.


## Different Packages

* instead of _dovecot-mysql_ use _dovecot-pgsql_
* instead of _postfix-mysql_ use _postfix-pgsql_


## Commands

* New domain: INSERT INTO domains (id, domain) VALUES (NEXTVAL('idgenerator'), 'mysystems.tld');
* New mailbox: INSERT INTO accounts (id, username, domain, password, quota, enabled, sendonly, fullusername) VALUES (NEXTVAL('idgenerator'), 'user1', 'mysystems.tld', '{SHA512-CRYPT}$6$wHyJsS[...]', 2048, true, false, 'user1@mysystems.tld');
* New alias: INSERT INTO aliases (id, source_username, source_domain, destination_username, destination_domain, enabled) VALUES (NEXTVAL('idgenerator'), 'alias', 'mysystems.tld', 'user1', 'mysystems.tld', true);
* New Tls Policy: INSERT INTO tlspolicies (id, domain, policy, params) VALUES (NEXTVAL('idgenerator'), 'gmx.de', 'secure', 'match=.gmx.net');

