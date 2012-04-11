# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery-mobile-rails"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Frank Lakatos"]
  s.date = "2010-11-26"
  s.description = "A gem to easily add mobile support to your Rails app!"
  s.email = ["me@fakingfantastic.com"]
  s.homepage = "https://github.com/fakingfantastic/jquery-mobile-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.17"
  s.summary = "Use jQueryMobile with Rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.14.4"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0"])
      s.add_dependency(%q<thor>, ["~> 0.14.4"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0"])
    s.add_dependency(%q<thor>, ["~> 0.14.4"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
  end
end
