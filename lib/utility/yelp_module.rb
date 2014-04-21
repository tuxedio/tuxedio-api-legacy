module Yelp

  # Main module method: this will return a
  # hash of the Yelp vendor data.
  def get_vendor_data
    data = parse_data

    if data.nil? or data.values.any? {|x| x.nil?}
      return false
    end

    return data
  end

  def get_vendor_json
    data = get_raw_data
    if data.nil?
      return false
    end

    return data
  end

  # Convert raw JSON into Ruby hash
  def parse_data
    raw_data = get_raw_data


    data = JSON.parse(raw_data)

    if data['total'] == 0 or data['error']
      return
    end

    data = data['businesses'][0]

    name     = data['name']
    add      = data['location']['display_address'][0]
    city     = data['location']['city']
    state    = data['location']['state_code']
    postal   = data['location']['postal_code']
    country  = data['location']['country_code']
    phone    = data['display_phone']
    image    = data['image_url']
    lat_long = JSON.parse(get_raw_data)['region']['center']


    parsed_data = { vendor_name:   name,   vendor_address: add,
                    vendor_city:   city,   vendor_state:   state,
                    vendor_postal: postal, vendor_country: country,
                    vendor_phone:  phone,  vendor_coordinates: lat_long,
                    vendor_image:  image }
  end

  def get_raw_data
    access_token = get_access_token
    search_name  = URI.encode_www_form_component(current_vendor.name)
    search_zip   = current_vendor.zip_code


    if access_token.nil?
      return
    end

    path = "/v2/search?term=#{search_name}&location=#{search_zip}&limit=1"
    access_token.get(path).body
  end

  def get_access_token
    # Eventually this info should be hidden once
    # we configure secrets.yml
    # Info is benign, however
    info = {
      cons_key:     'jfVdueylcOuv7LseRvDL7w',
      cons_secret:  'hf9Ry3bdpdGt0f3QuUDNL6QV8hM',
      token:        'vNH1-dM7f8ebU1hWORteNrsq4HFOPEUK',
      token_secret: '4B-JCC-kp0jAFjZXJUwThs_vqn4',
      host:         'http://api.yelp.com'
    }

    unless info.values.any? {|x| x.nil?}
      consumer = OAuth::Consumer.new(
        info[:cons_key],
        info[:cons_secret],
        site: info[:host]
      )

      access_token = OAuth::AccessToken.new(
        consumer,
        info[:token],
        info[:token_secret]
      )
    end

    access_token
  end
end
