class AccessToken < ActiveRecord::Base
  # attr_accessible :title, :body

  def self.last_authorized_token_for(application, resource_owner_id)
    # fix this later
    all(:parameters =>
         {:application_id => application.id,
          :resource_owner_id => resource_owner_id,
          :revoked_at => nil}
        ).sort_by(&:created_at).last
end
