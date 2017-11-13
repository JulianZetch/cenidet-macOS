# Para eliminar columnas
class RemoveStatusFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :status, :integer
  end
end
