class AccessToken < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def self.last_authorized_token_for(application_id, resource_owner_id)
    where({:application_id => application_id, :resource_owner_id => resource_owner_id, :revoked_at => nil}).
          order("created_at desc").first
          
  end
end
