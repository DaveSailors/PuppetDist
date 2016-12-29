# Class: testinst
#
#  create ../tests/init.pp and put:
#  include testinst
#  
#  - then from the command line run:
#  
#  puppet apply ../tests/init.pp
#

class testinst (

) {

# Start OS = Mac

  if $::kernel == 'Darwin' {

      # create the folder if it doesn't exist

      file { '/temp':
        ensure => directory,
        mode => '0755',
      }

     # Download a file from a web server

     file { 'googlechrome.dmg':
        path => '/temp/googlechrome.dmg',
        ensure  => file,
        source  => 'http://thewall.bz/drop/webin/googlechrome.dmg'
      }

     # mount the dmg file
     exec { 'mount_dmg_file':
       command => 'hdiutil attach /temp/googlechrome.dmg',
       path    => '/usr/bin/:/bin',
     }

     # copy the .app folder to /Applications
     exec { 'copy_app_in':
       command => 'cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications/',
       path    => '/usr/bin/:/bin',
     }

     # unmount the dmg file
     exec { 'unmount_dmg_file':
       command => 'hdiutil unmount "/Volumes/Google Chrome/"',
       path    => '/usr/bin/:/bin',
     }


  }   

 # --- End of OS = Mac
#-------
}
