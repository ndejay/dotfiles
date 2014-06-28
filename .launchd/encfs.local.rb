$encfs_path = '/opt/local/bin/encfs'

$mounts = [
  {
    source:      '~/Dropbox/Private',
    destination: '~/Private',
    password:    `security find-generic-password -l 'EncFS' -w`.chomp,
  },
]

$options = [
  'noappledouble',
]
