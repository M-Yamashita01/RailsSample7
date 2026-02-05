# frozen_string_literal: true

create_table :users, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
  t.string :name
  t.string :email
  # t.string :password_digest

  t.timestamps
  # t.index :email, unique: true, name: "index_users_on_email"
end
