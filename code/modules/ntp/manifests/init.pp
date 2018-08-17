#puppet module install puppetlabs-ntp # on puppet master

class { '::ntp':
  servers   => ['0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org'],
  interfaces => ['127.0.0.1']
  restrict  => [
    'default ignore',
    '-6 default ignore',
    '127.0.0.1',
    '-6 ::1',
    '0.pool.ntp.org nomodify notrap nopeer noquery',
    '1.pool.ntp.org nomodify notrap nopeer noquery',
    '2.pool.ntp.org nomodify notrap nopeer noquery',
    '3.pool.ntp.org nomodify notrap nopeer noquery'
  ],
}
