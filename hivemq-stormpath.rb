require 'formula'

class HivemqStormpath < Formula
  homepage 'http://www.hivemq.com/plugin/stormpath-plugin/'
  url 'http://www.hivemq.com/wp-content/uploads/stormpath-plugin-1.0.zip'
  sha1 '4662cf4d8b33df97b0a9e66a7fea9b3c4a7c09bd'

  depends_on 'hivemq'


  def install

    dir = "#{HOMEBREW_PREFIX}/Cellar/hivemq/*"
    libexec.install Dir['*']

    cp libexec/'sample-configuration/fileAuthConfiguration.properties', libexec
    cp libexec/'sample-configuration/credentials.properties', libexec

    Dir.glob(dir) do |directory|
      plugindir =  directory + "/libexec/plugins"
      mkdir plugindir unless File.exists?(plugindir)
      ln_sf Dir[libexec/'stormpath-plugin*.jar'], plugindir
      ln_sf Dir[libexec/'stormpath.properties'], plugindir
    end
  end

  def caveats
    "Make sure you read the documentation for the file Stormpath plugin at http://www.hivemq.com/plugin/stormpath-plugin/"
  end

  def caveats
    "Please set your Stormpath Keys properly. The configuration file for the utility can be found here: #{libexec}/stormpath.properties"
  end
end
