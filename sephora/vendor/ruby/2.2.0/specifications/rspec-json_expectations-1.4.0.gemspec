# -*- encoding: utf-8 -*-
# stub: rspec-json_expectations 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-json_expectations".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Oleksii Fedorov".freeze]
  s.date = "2016-07-05"
  s.description = "".freeze
  s.email = ["waterlink000@gmail.com".freeze]
  s.executables = ["build".freeze, "with-rspec-2".freeze, "with-rspec-3".freeze]
  s.files = ["bin/build".freeze, "bin/with-rspec-2".freeze, "bin/with-rspec-3".freeze]
  s.homepage = "https://github.com/waterlink/rspec-json_expectations".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.6".freeze
  s.summary = "Set of matchers and helpers to allow you test your APIs responses like a pro.".freeze

  s.installed_by_version = "2.6.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
