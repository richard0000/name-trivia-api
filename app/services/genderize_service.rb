require 'httparty'

class GenderizeService
  BASE_URL = 'https://gender-api.com/get'
  API_KEY = '5e5409eb156587ea6ef04cacc6b4e8a3c24068ce401e528c2e0b9f448b9ea45a'

  def self.get_gender_by_name(name)
    response = HTTParty.get(BASE_URL, query: { name: name, key: API_KEY })
    parsed_response = JSON.parse(response.body)

    if parsed_response.key?('gender')
      gender = parsed_response['gender']
      probability = parsed_response['accuracy']

      { gender: gender, probability: probability }
    else
      { error: 'Gender information not found' }
    end
  rescue StandardError => e
    { error: e.message }
  end
end
