#
#
#
class ::simple_nfs::directories(
    $support_dirs,
    $mount_dirs,
)
{


  file { $support_dirs :
    ensure => directory,
  }

  file { $mount_dirs :
    ensure  => directory,
    require => File[$support_dirs],
  }
}
