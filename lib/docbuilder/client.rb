# require 'httparty'
require 'httmultiparty'

module DocBuilder
  class Client
    # include HTTParty
    include HTTMultiParty
    # base_uri 'http://docbuilder.io'
    base_uri 'http://localhost:3000'

    class MissingIdAttributeError < RuntimeError; end
    class InvalidResponse < RuntimeError; end

    def initialize(api_key)
      @headers = { "X-APIKey" => api_key }
    end

    def convert_text(*args)
      url = '/api/generated_docs'
      attributes = extract_attributes(args)

      default_attributes = {
          :name                       => "default",
          :document_type              => "pdf",
          # :test                       => false,
          # :async                      => false,
          # :raise_exception_on_failure => false
      }
      body = default_attributes.merge(attributes)
      # raise_exception_on_failure = options.delete(:raise_exception_on_failure)

      verify_response(self.class.post(url, options.merge(body: body)))
    end

    def convert_file(file, *args)
      @headers["Content-Type"] = 'text/html'
      url = '/api/generated_docs'
      attributes = extract_attributes(args)

      default_attributes = {
          :html_file                  => file,
          :name                       => "default",
          :document_type              => "pdf",
          # :test                       => false,
          # :async                      => false,
          # :raise_exception_on_failure => false
      }
      body = default_attributes.merge(attributes)
      # raise_exception_on_failure = options.delete(:raise_exception_on_failure)

      verify_response(self.class.post(url, options.merge(body: body)))
    end

    def get_converted_doc_data(doc_id, *args)
      url = "/api/generated_docs/#{doc_id}"
      attributes = extract_attributes(args)

      # default_attributes = {
      #     :raise_exception_on_failure => false
      # }
      # body = default_attributes.merge(attributes)
      # raise_exception_on_failure = options.delete(:raise_exception_on_failure)

      verify_response(self.class.get(url, options.merge(body: attributes)))
    end

    private

    def verify_response(response)
      if response.code >= 200 && response.code < 300
        response
      else
        raise InvalidResponse.new("DocBuilder API returned a bad response: #{response.code}")
      end
    end

    def extract_attributes(args)
      hash = args.last.is_a?(Hash) ? args.pop : {}
      hash.inject({}){ |hash, (k,v)| hash[k.to_sym] = v; hash }
    end

    def options
      { :headers => @headers }
    end
  end
end