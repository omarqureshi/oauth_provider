class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text                   :email
      t.text                   :password_digest
      t.boolean		       :admin,          :null => false,       :default => false
      t.timestamps
    end
  end
end
