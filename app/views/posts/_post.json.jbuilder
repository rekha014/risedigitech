json.extract! post, :id, :title, :name, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
