require 'formula'

class HivemqMqttAccesslog < Formula
  homepage 'http://www.hivemq.com/plugin/mqtt-accesslog/'
  url 'http://www.hivemq.com/wp-content/uploads/access-log-1.1.0.zip'
  sha1 'a53d19380fa3abcbcb6a677880cc55d292429d36'

  depends_on 'hivemq'
  keg_only "This is a HiveMQ plugin"


  def install
    dir = "#{HOMEBREW_PREFIX}/Cellar/hivemq/*"
    libexec.install Dir['*.jar']
    Dir.glob(dir) do |directory|
      plugindir =  directory + "/libexec/plugins"
      mkdir plugindir unless File.exists?(plugindir)
      ln_sf Dir[libexec/'access-log*.jar'], plugindir
    end
  end

  def caveats
    "Your access log is located here: <HiveMQ directory>/log/hivemq-access.log"
  end
end
