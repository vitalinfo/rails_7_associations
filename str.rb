# frozen_string_literal: true

require 'bundler/inline'

gemfile(true) do
  source 'https://rubygems.org'

  gem 'rails', '7.0.3'
  gem 'sqlite3'
end

require 'active_record'
require 'minitest/autorun'
require 'logger'

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Base.logger = Logger.new($stdout)

ActiveRecord::Schema.define do
  create_table 'companies', force: :cascade, &:timestamps

  create_table 'memberships', force: :cascade do |t|
    t.integer 'company_id'
    t.integer 'user_id'
    t.timestamps
  end

  create_table 'profiles', force: :cascade do |t|
    t.integer 'user_id'
    t.timestamps
  end

  create_table 'user_settings', force: :cascade do |t|
    t.integer 'user_id'
    t.timestamps
  end

  create_table 'users', force: :cascade do |t|
    t.string 'type', null: false
    t.timestamps
  end
end

class Company < ActiveRecord::Base
  has_many :memberships, inverse_of: :company, dependent: :destroy
  has_many :users, through: :memberships

  has_many :profiles, through: :users
  has_many :user_settings, through: :users
end

class Membership < ActiveRecord::Base
  belongs_to :company, inverse_of: :memberships
  belongs_to :user, inverse_of: :memberships, class_name: 'User::Simple'
end

class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile, class_name: 'User::Simple'
end

class UserSetting < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_setting, class_name: 'User::Simple'
end

class User < ActiveRecord::Base
  has_one :profile, inverse_of: :user, dependent: :destroy
  has_one :user_setting, inverse_of: :user, dependent: :destroy

  has_many :memberships, inverse_of: :user, dependent: :destroy

  after_create do
    create_profile(user: self)
    create_user_setting(user: self)
  end
end

class User
  class Simple < User
  end
end

class BugTest < Minitest::Test
  def test_preload
    count = rand(1..10)
    company = Company.create!
    count.times { Membership.create!(company: company, user: User::Simple.create!) }

    list = Company.all.preload(:profiles, :user_settings)

    assert_equal count, list.map(&:profiles).flatten.size
    assert_equal count, list.map(&:user_settings).flatten.size
  end
end
