node default {
#  stage { 'pre': before => Stage['main'] }
#  class { 'epel': stage => 'pre' }
#  class { 'common': }

  class { 'apache': }
  
  $proxy_pass = [
                   { 'path' => '/castest', 'url' => 'ajp://localhost:8009/castest' }
                 ]
  

  apache::vhost { 'ec2-54-209-26-144.compute-1.amazonaws.com':
        port    => '443',
        docroot => '/opt/nepho/data/common/puppet/templates/',
        ssl     => true,
    proxy_pass       => $proxy_pass,
  }
  apache::mod { 'proxy_ajp': }
#  include apache::mod::proxy_ajp
  class { 'tomcat': }
}
