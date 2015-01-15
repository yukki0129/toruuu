json.array!(@pr_videos) do |pr_video|
  json.extract! pr_video, :id, :title, :video, :description
  json.url pr_video_url(pr_video, format: :json)
end
