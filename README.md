# simple_nfs

This is a wrapper for https://forge.puppet.com/derdanne/nfs nfs module for systems which don't handle puppet defines
very well (like the Foreman).

### Usage
```puppet
class { simple_nfs :
  exports      => {'/data/folder' =>
                      {'clients' => '10.0.0.0/24(rw,insecure,async,no_root_squash) localhost(rw)' },
                   '/data/folder2' =>
                      {'clients' => '10.0.0.0/24(rw,insecure,async,no_root_squash) localhost(rw)' }
                  }
  support_dirs => ['/data']
}
```

`support_dirs` is an array directory needed to host subdirs.

`exports` is a hash with the exported folder and clients configuration.
