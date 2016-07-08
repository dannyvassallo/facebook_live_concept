class AddAuthInfoToIdentities < ActiveRecord::Migration[5.0]
  def change
    add_column :identities, :oauth_token, :string
    add_column :identities, :oauth_expires_at, :datetime
  end
end
