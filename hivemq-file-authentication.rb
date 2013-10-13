require 'formula'

class HivemqFileAuthentication < Formula
  homepage 'http://www.hivemq.com/plugin/file-authentication/'
  url 'http://www.hivemq.com/wp-content/uploads/file-authentication-2.0.1.zip'
  sha1 '990ae2139195d8e5f277bb9dc8c8505ef63b80d7'

  depends_on 'hivemq'


  def install

    dir = "#{HOMEBREW_PREFIX}/Cellar/hivemq/*"
    libexec.install Dir['*']

    cp libexec/'sample-configuration/fileAuthConfiguration.properties', libexec
    cp libexec/'sample-configuration/credentials.properties', libexec

    Dir.glob(dir) do |directory|
      plugindir =  directory + "/libexec/plugins"
      mkdir plugindir unless File.exists?(plugindir)
      ln_sf Dir[libexec/'file-authentication-plugin*.jar'], plugindir
      ln_sf Dir[libexec/'fileAuthConfiguration.properties'], plugindir
      ln_sf Dir[libexec/'credentials.properties'], plugindir
    end

    #Install the File authentication utility
    file_auth_jar = "#{libexec}/utility/*.jar"
    Dir.glob(file_auth_jar) do |filename|
      File.open("#{libexec}/utility/file-authentication-utility", 'w') {|f| f.write("java -jar #{filename}") }
    end
    bin.write_exec_script "#{libexec}/utility/file-authentication-utility"
    chmod 0755,"#{libexec}/utility/file-authentication-utility"
  end

  def caveats
    "Make sure you read the documentation for the file authentication plugin at http://www.hivemq.com/plugin/file-authentication/"
  end

  def caveats
    "You can use the file-authentication-utility to edit the access control list. The configuration file for the utility can be found here: #{libexec}/fileAuthConfiguration.properties"
  end
end
