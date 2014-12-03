require 'yaml'

# Custom YAML sanitizer for JobReady projects. Fixes issues with serialising
# carrierwave columns when carrierwave-cascade is involved.
module PaperTrail
  module Serializers
    module JobReady
      module YAML
        extend self

        def load(yaml_string)
          ::YAML.load(yaml_string)
        end

        def dump(object)
          sanitized_object = {}

          object.each do |k, v|
            sanitized_object[k] =
              v.is_a?(Array) ? sanitize_array(v) : sanitize_non_array(v)
          end

          ::YAML.dump(sanitized_object)
        end

        private

        def sanitize_array(array)
          array.map { |item| sanitize_non_array(item) }
        end

        def sanitize_non_array(value)
          value.is_a?(CarrierWave::Uploader::Base) ? value.url : value
        end
      end
    end
  end
end

