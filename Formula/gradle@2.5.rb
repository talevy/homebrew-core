class GradleAT25 < Formula
  desc "Build system based on the Groovy language"
  homepage "https://www.gradle.org/"
  url "https://downloads.gradle.org/distributions/gradle-2.5-all.zip"
  sha256 "b71ab21fa5e91dcc6a4bd723b13403e8610a6e1b4b9d4b314ff477820de00bf9"

  bottle :unneeded

  option "with-all", "Installs Javadoc, examples, and source in addition to the binaries"

  depends_on :java => "1.7+"

  def install
    libexec.install %w[bin lib]
    libexec.install %w[docs media samples src] if build.with? "all"
    bin.install_symlink libexec/"bin/gradle"
  end

  test do
    ENV.java_cache
    assert_match version.to_s, shell_output("#{bin}/gradle --version")
  end
end