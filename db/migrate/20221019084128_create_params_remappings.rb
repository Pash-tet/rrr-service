class CreateParamsRemappings < ActiveRecord::Migration[7.0]
  def change
    create_table :params_remappings do |t|
      t.references :route, index: true
      t.string :initial_key
      t.string :remapped_key
      t.string :initial_value
      t.string :remapped_value
    end
  end
end
