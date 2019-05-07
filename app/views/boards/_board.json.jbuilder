json.extract! board, :id, :email, :created_at, :updated_at
json.url board_url(board, format: :json)
