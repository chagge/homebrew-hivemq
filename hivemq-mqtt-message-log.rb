require 'formula'

class HivemqMqttMessageLog < Formula
  homepage 'http://www.hivemq.com/plugin/mqtt-message-log/'
  url 'http://www.hivemq.com/wp-content/uploads/mqtt-message-log-1.0.0.zip'
  sha1 '79f5adc4acf940236ff3cf9557ac1da5746a0ccd'

  depends_on 'hivemq'
  keg_only "This is a HiveMQ plugin"


  def install
    dir = "#{HOMEBREW_PREFIX}/Cellar/hivemq/*"
    libexec.install Dir['*.jar']
    Dir.glob(dir) do |directory|
      plugindir =  directory + "/libexec/plugins"
      mkdir plugindir unless File.exists?(plugindir)
      ln_sf Dir[libexec/'mqtt-message-log*.jar'], plugindir
    end
  end
end
