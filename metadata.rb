name             'alredy'
maintainer       'Grammarly, Inc.'
maintainer_email ''
license          'MIT'
description      'Installs/Configures users'
#long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'
depends         'sudo'


attribute 'sys_dir',
  :display_name => 'dirname',
  :description  => '',
  :type         => 'string',
  :default      => 'grammarly'
