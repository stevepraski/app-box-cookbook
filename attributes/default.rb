default['app-box']['httpd']['src_root'] = '/var/www'
default['app-box']['httpd']['doc_root'] = '/var/www/html'
default['app-box']['httpd']['admin_email'] = 'root@localhost'
default['app-box']['httpd']['server_name'] = nil
default['app-box']['httpd']['listen_port'] = '80'

default['app-box']['php_version'] = '7.0'
default['app-box']['php_extras'] = ['php7.0-pgsql', 'libapache2-mod-php7.0']

default['app-box']['postgres_version'] = '9.5'
default['postgresql']['config']['listen_addresses'] = '*'
default['app-box']['db']['root_password'] = 'PgP4ssw0d'
default['app-box']['db']['user_password'] = 'UserP4ssword'
default['app-box']['db']['server'] = '192.168.1.107'
default['app-box']['db']['user_name'] = 'app-user'
default['app-box']['db']['db_name'] = 'app'
