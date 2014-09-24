require 'formula'

class Hivemq < Formula
  homepage 'http://www.hivemq.com'
  url 'http://www.hivemq.com/wp-content/uploads/hivemq-2.1.0.zip'
  sha1 '74d97bf4c957f40885a3cd524ab8f6bbdd86f27f'

  def install
    cp 'bin/run.sh', 'bin/hivemq'
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/hivemq'
  end

  def caveats
    "To configure HiveMQ, execute 'vi " + libexec + "/conf/configuration.properties'"
  end
end
