class CreateFtcs < ActiveRecord::Migration
  def change
    create_table :ftcs do |t|
      t.string :code
      t.boolean :exception
      t.string :shortdesc
      t.string :longdesc

      t.timestamps null: false
    end
  end
end
