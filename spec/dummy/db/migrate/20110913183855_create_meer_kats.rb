class CreateMeerKats < ActiveRecord::Migration
  def change
    create_table :meer_kats do |t|

      t.timestamps
    end
  end
end
