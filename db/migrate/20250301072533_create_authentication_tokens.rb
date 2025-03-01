class CreateAuthenticationTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :authentication_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token
      t.string :token_type
      t.datetime :expires_at

      t.timestamps
    end
  end
end
