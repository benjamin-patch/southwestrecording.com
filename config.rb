activate :directory_indexes
set :partials_dir, 'partials'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :interior do
#   page "/audio-services.html"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  def title_tag
    if current_page.data.title.present?
      current_page.data.title + " | Southwest Recording"
    else
      "Southwest Recording"
    end
  end

  def meta_description
    if current_page.data.meta_description.present?
      current_page.data.meta_description
    else
      "Default meta description for Southwest Recording."
    end
  end

  def page_title
    if current_page.data.title.present?
      current_page.data.title
    else
      "Untitled Page"
    end
  end

  def testimonial
    if current_page.data.testimonial.present?
      current_page.data.testimonial
    else
      "Southwest Recording is the best!"
    end
  end

  def client
    if current_page.data.client.present?
      current_page.data.client
    else
      "Anonymous"
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
