class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.string :tag
      t.boolean :read, :default => false

      t.timestamps
    end

    add_reference :links, :user, index: true
  end
end
