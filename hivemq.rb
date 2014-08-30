require 'formula'

class Hivemq < Formula
  homepage 'http://www.hivemq.com'
  url 'http://www.hivemq.com/wp-content/uploads/hivemq-2.0.2.zip'
  sha1 '20ece51f558c1dd7b7c8147cc9e7f24d1da22e71'

  def install
    cp 'bin/run.sh', 'bin/hivemq'
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/hivemq'
  end

  def caveats
    "To configure HiveMQ, execute 'vi " + libexec + "/conf/configuration.properties'"
  end
end
