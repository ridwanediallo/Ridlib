class SetDefaultRatingToZero < ActiveRecord::Migration[7.0]
  def change
    change_column_default :ratings, :rating, 0
  end
end
