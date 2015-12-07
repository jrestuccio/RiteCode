class CreateIcd9s < ActiveRecord::Migration
  def change
    create_table :icd9s do |t|
      t.string :code
      t.boolean :exception
      t.string :shortdesc
      t.string :longdesc

      t.timestamps null: false
    end
  end
end
