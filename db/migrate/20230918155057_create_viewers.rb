class CreateViewers < ActiveRecord::Migration[6.1]
  def change
    create_table :viewers do |t|
      t.string :ip_address, :null => false

      t.timestamps
    end
  end
end
