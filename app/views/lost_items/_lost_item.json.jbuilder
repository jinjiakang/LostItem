json.extract! lost_item, :id, :title, :description, :location, :found_date, :is_approved, :is_solved, :note, :user_id, :created_at, :updated_at
json.url lost_item_url(lost_item, format: :json)
