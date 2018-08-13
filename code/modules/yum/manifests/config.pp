class yum::config {

  file { '/etc/yum.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/yum/yum.conf',
  }

}
