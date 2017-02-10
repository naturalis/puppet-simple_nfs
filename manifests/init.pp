# Class: simple_nfs
# ===========================
#
#
#
#

class simple_nfs (
  $exports = {'/data/folder' => {'clients' => '10.0.0.0/24(rw,insecure,async,no_root_squash) localhost(rw)' }},
  $support_dirs = [],
){
  $mount_dirs = keys($exports)

  stage { 'pre':
    before => Stage['main'],
  }

  class {'::simple_nfs::directories' :
    stage        => 'pre',
    support_dirs => $support_dirs,
    mount_dirs   => $mount_dirs,
  }


  class { '::nfs':
      server_enabled => true
  }

  create_resources(nfs::server::export, $exports, {})
}
