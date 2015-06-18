$sshfs_path = '/opt/local/bin/sshfs'

$mounts = [
  {
    source:      'user@remote:/path/to/source',
    destination: '/path/to/destination',
    port:        '22', # Optional
  },
  {
    source:      'user@remote:/path/to/source',
    destination: '/path/to/destination',
  },
]

$options = [
  'auto_cache',
  'defer_permissions',
  'follow_symlinks',
  'noappledouble',
  'reconnect',
]
