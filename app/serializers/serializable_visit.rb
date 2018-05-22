class SerializableVisit < JSONAPI::Serializable::Resource
  type 'visits'

  attributes :ip, :referrer, :user_agent

  belongs_to :redirect do
    link :self do
      @url_helpers.api_redirect_url(@object.redirect.id, host: Rails.configuration.x.base_url)
    end
  end

end
