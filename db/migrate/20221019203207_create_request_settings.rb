class CreateRequestSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :request_settings do |t|
      t.string :key, null: false
      t.string :value, null: false
      t.boolean :interpolated, default: false
    end

    add_index :request_settings, :key, unique: true
  end
end
