class AccessGrant < ActiveRecord::Base
  attr_accessible :application_id, :expires_in, :redirect_uri, :resource_owner_id, :scopes, :token
end
