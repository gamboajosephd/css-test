
activate :livereload

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :blog do |blog|
  blog.prefix = "notes"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.tag_template = "tag.html"
  blog.paginate = true
end

activate :directory_indexes

set :relative_links, true
page "/404.html", directory_index: false

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, 
               :smartypants => true,
               :autolink => true,
               :strikethrough => true

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.branch = "master"
end