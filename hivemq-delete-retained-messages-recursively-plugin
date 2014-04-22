require 'formula'

class HivemqDeleteRetainedMessagesRecursively < Formula
  homepage 'http://www.hivemq.com/plugin/delete-retained-messages-recursively-plugin/'
  url 'http://www.hivemq.com/wp-content/uploads/delete-retained-messages-recursively-plugin-1.0.0-distribution.zip'
  sha1 'a193e75003ad39da19fcb94bc8fca5dcabbb9562'

  depends_on 'hivemq'
  keg_only "This is a HiveMQ plugin"


  def install
    dir = "#{HOMEBREW_PREFIX}/Cellar/hivemq/*"
    libexec.install Dir['*.jar']
    Dir.glob(dir) do |directory|
      plugindir =  directory + "/libexec/plugins"
      mkdir plugindir unless File.exists?(plugindir)
      ln_sf Dir[libexec/'delete-retained-messages-recursively-plugin*.jar'], plugindir
    end
  end
end
