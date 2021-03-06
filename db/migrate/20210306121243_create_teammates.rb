class CreateTeammates < ActiveRecord::Migration[6.1]
  def change
    create_table :teammates do |t|
      t.references :room_base, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
