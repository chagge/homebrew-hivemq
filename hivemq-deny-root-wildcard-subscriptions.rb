require 'formula'

class HivemqDenyRootWildcardSubscriptions < Formula
  homepage 'http://www.hivemq.com/plugin/deny-root-wildcard-subscriptions/'
  url 'http://www.hivemq.com/wp-content/uploads/deny-wildcard-plugin-1.0-distribution.zip'
  sha1 '911d7e026f083cd5d82bbe31c9a5d0ea86d87129'

  depends_on 'hivemq'
  keg_only "This is a HiveMQ plugin"


  def install
    dir = "#{HOMEBREW_PREFIX}/Cellar/hivemq/*"
    libexec.install Dir['*.jar']
    Dir.glob(dir) do |directory|
      plugindir =  directory + "/libexec/plugins"
      mkdir plugindir unless File.exists?(plugindir)
      ln_sf Dir[libexec/'deny-wildcard-plugin*.jar'], plugindir
    end
  end
end
