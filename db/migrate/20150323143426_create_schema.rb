class CreateSchema < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username
  		t.string :password_hash

  		t.timestamps
  	end

  	create_table :questions do |t|
  		t.string :title
  		t.string :body
  		t.integer :user_id

  		t.timestamps
  	end

  	create_table :answers do |t|
  		t.string :title
  		t.string :body
  		t.integer :question_id
  		t.integer :user_id

  		t.timestamps
  	end

  	create_table :votes do |t|
  		t.integer :point
  		t.integer :parent_id
  		t.string :parent_type
  		t.integer :user_id

  		t.timestamps
  	end	
  end
end
