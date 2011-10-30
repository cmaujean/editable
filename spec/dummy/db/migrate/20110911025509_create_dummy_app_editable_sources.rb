class CreateDummyAppEditableSources < ActiveRecord::Migration
  def change
    create_table :editable_sources do |t|
      t.references :editable, :polymorphic => true
      
      t.text :editable_data, :null => true
      t.string :processor, :null => false
      t.string :editable_field
      
      t.timestamps
    end
  end
end
