require 'formula'

class Hivemq < Formula
  homepage 'http://www.hivemq.com'
  url 'http://www.hivemq.com/wp-content/uploads/hivemq-2.0.0.zip'
  sha1 '3597dffd58bac3dca75153baac4d2dcb8dcfde47'

  def install
    cp 'bin/run.sh', 'bin/hivemq'
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/hivemq'
  end

  def caveats
    "To configure HiveMQ, execute 'vi " + libexec + "/conf/configuration.properties'"
  end
end
