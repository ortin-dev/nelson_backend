class CreateExecutors < ActiveRecord::Migration[6.1]
  def change
    create_table :executors do |t|
      t.references :board_ticket, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
