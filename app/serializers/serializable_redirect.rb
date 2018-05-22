class SerializableRedirect < JSONAPI::Serializable::Resource
  type 'redirects'

  attributes :url, :created_at

  has_many :visits do
    data do
      @object.visits
    end

    link :related do
      @url_helpers.api_redirect_visits_url(@object.id, host: Rails.configuration.x.base_url)
    end

    meta do
      { count: @object.visits.count }
    end
  end

  link :self do
    @url_helpers.api_redirect_url(@object.id, host: Rails.configuration.x.base_url)
  end

end
