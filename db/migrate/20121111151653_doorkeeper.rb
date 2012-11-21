class Doorkeeper < ActiveRecord::Migration
  
  def up
    create_table :applications do |t|
      t.string  :name,         :null => false
      t.string  :uid,          :null => false
      t.string  :secret,       :null => false
      t.string  :redirect_uri, :null => false
      t.timestamps
    end

    add_index :applications, :uid, :unique => true

    create_table :access_grants do |t|
      t.integer  :resource_owner_id, :null => false
      t.integer  :application_id,    :null => false
      t.string   :token,             :null => false
      t.integer  :expires_in,        :null => false
      t.string   :redirect_uri,      :null => false
      t.datetime :created_at,        :null => false
      t.datetime :revoked_at
      t.string   :scopes
    end

    add_index :access_grants, :token, :unique => true

    create_table :access_tokens do |t|
      t.integer  :resource_owner_id
      t.integer  :application_id,    :null => false
      t.string   :token,             :null => false
      t.string   :refresh_token
      t.integer  :expires_in
      t.datetime :revoked_at
      t.datetime :created_at,        :null => false
      t.string   :scopes
    end

    add_index :access_tokens, :token, :unique => true
    add_index :access_tokens, :resource_owner_id
    add_index :access_tokens, :refresh_token, :unique => true
  end

end
