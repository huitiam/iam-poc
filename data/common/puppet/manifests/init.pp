node default {
#  stage { 'pre': before => Stage['main'] }
#  class { 'epel': stage => 'pre' }
#  class { 'common': }

  class { 'apache': }
  
  apache::vhost { 'localhost': 
  	port    => '80',
    docroot => '/opt/nepho/data/common/puppet/templates/',
  }
    class { 'tomcat': }
apache::vhost { 'ssl.example.com':
        port    => '443',
        docroot => '/var/www/ssl',
        ssl     => true,
      }
}
