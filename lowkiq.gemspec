# frozen_string_literal: true

$LOAD_PATH.unshift 'lib'
require_relative "lib/lowkiq/version"

Gem::Specification.new do |spec|
  spec.name = "lowkiq"
  spec.version = Lowkiq::VERSION
  spec.authors = ["hikaru-nakayama"]
  spec.email = ["hikaru-nakayama@c-fo.com"]

  spec.summary = "Hello"
  spec.description = "Background jobs for Ruby."
  spec.homepage = "https://github.com/hikaru-nakayama/lowkiq"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = "https://github.com/hikaru-nakayama/lowkiq"
  spec.metadata["source_code_uri"] = "https://github.com/hikaru-nakayama/lowkiq"
  spec.metadata["changelog_uri"] = "https://github.com/hikaru-nakayama/lowkiq"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end