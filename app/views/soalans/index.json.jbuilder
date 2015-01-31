json.array!(@soalans) do |soalan|
  json.extract! soalan, :id, :name, :title, :description
  json.url soalan_url(soalan, format: :json)
end
