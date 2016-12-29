# Class: test21
#
#  create ../tests/init.pp and put:
#  include test21
#  
#  - then from the command line run:
#  
#  puppet apply ../tests/init.pp
#

class test21 (
  $template = undef,
  $content = undef,
  $test21_hiera = hiera('test21_message')


) {
  $template_content = template('test21/test21-template.erb')

    # Start OS = Mac
  if $::kernel == 'Darwin' {

      # create the folder if it doesn't exist

      file { '/temp':
        ensure => directory,
        mode => '0755',
      }

      file { '/temp/created.by.test21.txt':
        ensure  => file,
        backup  => false,
        content => "$template_content \n\n $test21_hiera \n\n - this line comes directly from init.pp in the module as text \n\n",
      }


     file { 'googlechrome.dmp':
        path => '/temp/googlechrome.dmg',
        ensure  => file,
        source  => 'http://thewall.bz/drop/webin/googlechrome.dmg'
      }

     file { 'testing.txt':
        path => '/temp/testing.txt',
        ensure  => file,
        source  => 'https://raw.githubusercontent.com/DaveSailors/PuppetDist/master/installers/mac/testing.txt'
      }




  }    # --- End of OS = Mac
#-------
}
