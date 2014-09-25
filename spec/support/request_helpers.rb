module Requests
  module JsonHelpers
    ParsedJson = DeepStruct

    def response_body
      @response_body ||= ParsedJson.wrap(JSON.parse response.body)
    end

    def parse_json(json)
      ParsedJson.wrap(JSON.parse json)
    end
  end

  module HeadersHelpers
    def headers_for(type)
      __headers.send type
    end

    def __headers
      headers = OpenStruct.new
      headers.json = {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
      headers
    end
  end
end
