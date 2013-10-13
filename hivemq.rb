require 'formula'

class Hivemq < Formula
  homepage 'http://www.hivemq.com'
  url 'http://www.hivemq.com/wp-content/uploads/hivemq-1.4.1.zip'
  sha1 'd809e7d3b35a0626665e37fd70fc4684faff419f'

  def install
    cp 'bin/run.sh', 'bin/hivemq'
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/hivemq'
    mkdir libexec/'plugins'
  end

  def caveats
    "To configure HiveMQ, execute 'vi " + libexec + "/conf/configuration.properties'"
  end
end
