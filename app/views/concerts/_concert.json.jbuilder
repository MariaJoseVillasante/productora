json.extract! concert, :id, :fecha, :asistentes, :lugar, :duracion, :group_id, :created_at, :updated_at
json.url concert_url(concert, format: :json)
