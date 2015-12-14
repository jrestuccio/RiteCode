class RemoveExceptionFromIcd9 < ActiveRecord::Migration
  def change
    remove_column :icd9s, :exception, :boolean
  end
end
