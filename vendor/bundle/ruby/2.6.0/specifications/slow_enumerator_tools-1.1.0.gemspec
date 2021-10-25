# -*- encoding: utf-8 -*-
# stub: slow_enumerator_tools 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "slow_enumerator_tools".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2017-11-08"
  s.email = ["denis.defreyne@stoneship.org".freeze]
  s.homepage = "https://github.com/ddfreyne/slow_enumerator_tools".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "provides tools for transforming Ruby enumerators that produce data slowly and unpredictably".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
  end
end
