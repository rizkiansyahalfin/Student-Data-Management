require 'yaml'

# Compatibility patch for Psych 4+ / Ruby 3.1+ YAML alias loading in Rails 6 & Webpacker
module Psych
  class << self
    def safe_load(yaml, *args, **kwargs)
      unsafe_load(yaml)
    end

    def load_file(path, *args, **kwargs)
      unsafe_load_file(path)
    end
  end
end
