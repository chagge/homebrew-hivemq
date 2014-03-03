require 'formula'

class Hivemq < Formula
  homepage 'http://www.hivemq.com'
  url 'http://www.hivemq.com/wp-content/uploads/hivemq-1.5.0.zip'
  sha1 '4ac7ef891145d64fdeb13581092b77adc4ef221a'

  def install
    cp 'bin/run.sh', 'bin/hivemq'
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/hivemq'
  end

  def caveats
    "To configure HiveMQ, execute 'vi " + libexec + "/conf/configuration.properties'"
  end
end
