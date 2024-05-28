# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ##Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false
      t.string :name, null:false
      t.text :profile, null:false
      t.text :occupation, null:false
      t.text :position, null:false
    end
  end
end
