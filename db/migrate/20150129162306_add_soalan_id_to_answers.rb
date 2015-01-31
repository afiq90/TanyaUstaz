class AddSoalanIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :soalan_id, :integer
  end
end
