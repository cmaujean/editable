class CreateBigPigs < ActiveRecord::Migration
  def change
    create_table :big_pigs do |t|
      t.string :body

      t.timestamps
    end
  end
end
