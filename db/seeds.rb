# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Load seed data
seed = File.join File.dirname(__FILE__), 'seed_data.yml'
data = YAML.load_file(seed).deep_symbolize_keys

# Populate seed data
admin       = PushType::User.create! data[:admin].merge(confirmed_at: Time.zone.now)
blog        = ArticleList.create! title: 'Blog', slug: 'blog', status: PushType::Node.statuses[:published]
pages       = Page.create! data[:pages].map { |a| a.merge creator: admin, updater: admin, status: PushType::Node.statuses[:published] }
parent      = CategoryList.create title: 'Categories', slug: 'categories', status: PushType::Node.statuses[:published]
categories  = Category.create! data[:categories].map { |c| c.merge status: PushType::Node.statuses[:published], parent_id: parent.id }

Article.create! data[:articles].map { |a| a.merge creator: admin, updater: admin, status: PushType::Node.statuses[:published], parent_id: blog.id, category_id: categories.sample.id }
