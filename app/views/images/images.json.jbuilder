json.images(@images) do |image|
  json.extract! image, :id, :name
  json.published_at image.created_at.strftime('%a, %e %b %Y %I:%M %p %Z')
  json.thumbnail image.file.attached? ? url_for( image.file.variant(resize: '150x150') ) : '//via.placeholder.com/150'

end
json.total @images.count
json.upload_url new_image_path
