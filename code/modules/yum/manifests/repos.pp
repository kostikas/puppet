class repositories::base {

  $repos = [ 'epel', 'rhel' ]

  $repos.each |String $repo| {

    file { "/etc/yum.repos.d/${repo}.repo":
      ensure  => 'present',
      mode    => '0644',
      owner   => root,
      group   => root,
      content => epp('repositories/repo.epp', {
        'repo' => "${repo}${facts['os']['release']['major']}",
      }),
    }
  }

# Ensure only the below files will exist in the directory
  file { '/etc/yum.repos.d':
    recurse => true,
    purge   => true,
    ignore  => [ "$repos" ]
  }
}
