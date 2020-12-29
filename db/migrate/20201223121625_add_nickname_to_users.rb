class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :family_name_kanji, :string
    add_column :users, :first_name_kanji, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :birthday, :string
  end
end
