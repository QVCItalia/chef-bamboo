## Description

Installs/Configures [Atlassian Bamboo](https://www.atlassian.com/software/bamboo/) server.

## Requirements

### Platforms

* CentOS 6
* RHEL 6
* Ubuntu 12.04, 12.10, 13.04

### Chef

* The cookbook requires Chef 11 due to `ark` usage

### Databases

* HSQLDB (not recommended for production usage)
* MySQL
* Postgres
* Percona

### Cookbooks

Required [Opscode Cookbooks](https://github.com/opscode-cookbooks/)

* [apache2](https://github.com/opscode-cookbooks/apache2) (if using Apache 2 proxy)
* [ark](https://github.com/opscode-cookbooks/ark)
* [database](https://github.com/opscode-cookbooks/database)
* [java](https://github.com/opscode-cookbooks/java)
* [mysql](https://github.com/opscode-cookbooks/mysql) (if using MySQL database)
* [postgresql](https://github.com/opscode-cookbooks/postgresql) (if using Postgres database)

Third-Party Cookbooks

* [mysql_connector](https://github.com/bflad/chef-mysql_connector) (if using MySQL/Percona database)
* [percona](https://github.com/phlipper/chef-percona) (if using Percona database)

## Attributes

These attributes are under the `node['bamboo']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
checksum | SHA256 checksum for Bamboo install | String | auto-detected (see attributes/default.rb)
home_path | home data directory for Bamboo user | String | /var/atlassian/application-data/bamboo
install_path | location to install Bamboo | String | /opt/atlassian
install_type | Bamboo install type - "standalone" only for now | String | standalone
url_base | URL base for Bamboo install | String | http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo
url | URL for Bamboo install | String | auto-detected (see attributes/default.rb)
user | user to run Bamboo | String | bamboo
version | Bamboo version to install | String | 5.5.1

### Bamboo Database Attributes

All of these `node['bamboo']['database']` attributes are overridden by `bamboo/bamboo` encrypted data bag (Hosted Chef) or data bag (Chef Solo), if it exists

Attribute | Description | Type | Default
----------|-------------|------|--------
host | FQDN or "localhost" (localhost automatically installs `['database']['type']` server) | String | localhost
name | Bamboo database name | String | bamboo
password | Bamboo database user password | String | changeit
port | Bamboo database port | Fixnum | 3306
testInterval | Bamboo database pool idle test interval in minutes | Fixnum | 2
type | Bamboo database type - "hsqldb" (not recommended), "mysql", "percona" or "postgresql" | String | mysql
user | Bamboo database user | String | bamboo

### Bamboo JVM Attributes

These attributes are under the `node['bamboo']['jvm']` namespace.

Attribute | Description | Type | Default
----------|-------------|------|--------
minimum_memory | JVM minimum memory | String | 512m
maximum_memory | JVM maximum memory | String | 768m
maximum_permgen | JVM maximum PermGen memory | String | 256m
java_opts | additional JAVA_OPTS to be passed to Bamboo JVM during startup | String | ""
support_args | additional JAVA_OPTS recommended by Atlassian support for Bamboo JVM during startup | String | ""

### Bamboo Tomcat Attributes

These attributes are under the `node['bamboo']['tomcat']` namespace.

Any `node['bamboo']['tomcat']['key*']` attributes are overridden by `bamboo/bamboo` encrypted data bag (Hosted Chef) or data bag (Chef Solo), if it exists

Attribute | Description | Type | Default
----------|-------------|------|--------
keyAlias | Tomcat SSL keystore alias | String | tomcat
keystoreFile | Tomcat SSL keystore file - will automatically generate self-signed keystore file if left as default | String | `#{node['bamboo']['home_path']}/.keystore`
keystorePass | Tomcat SSL keystore passphrase | String | changeit
port | Tomcat HTTP port | Fixnum | 8085
ssl_port | Tomcat HTTPS port | Fixnum | 8443
context | Tomcat context | String | ""

## Recipes

* `recipe[bamboo]` Installs Atlassian Bamboo with built-in Tomcat and Apache 2 proxy
* `recipe[bamboo::apache2]` Installs/configures Apache 2 proxy for Bamboo (ports 80/443)
* `recipe[bamboo::configuration]` Configures Bamboo's settings
* `recipe[bamboo::database]` Installs/configures MySQL/Percona/Postgres server, database, and user for Bamboo
* `recipe[bamboo::linux_standalone]` Installs/configures Bamboo via Linux standalone archive
* `recipe[bamboo::service_init]` Installs/configures Bamboo init service
* `recipe[bamboo::tomcat_configuration]` Configures Bamboo's built-in Tomcat

## Contributing

Please use standard Github issues/pull requests.

## License and Contributors

Please see license information in: [LICENSE](LICENSE)

* Sergio Leone <sergio.leone@qvc.com>
