json.extract! video, :id, :title, :video_link, :section_id, :created_at, :updated_at
json.url video_url(video, format: :json)
