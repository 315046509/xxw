class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :name, :limit => 10 #真实姓名
      t.string :email, :limit => 50 #邮箱地址
      t.string :tel, :limit => 20 #手机号码
      t.string :card_id
      t.string :address #地址
      t.integer :sex_id, :default => 0

      t.timestamps
    end
  end
end