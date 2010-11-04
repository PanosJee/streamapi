# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "streamapi/version"

Gem::Specification.new do |s|
  s.name        = "streamapi"
  s.version     = Streamapi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Panagiotis Papadoulos"]
  s.email       = ["panosjee@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/streamapi"
  s.summary     = %q{A simple Ruby client for the StreamAPI api}
  s.description = %q{StreamAPI is the easiest and most cost effective way to incorporate live streaming video into your website or application.}

  s.rubyforge_project = "streamapi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
