set :url_root, 'https://southwestrecording.com'

activate :search_engine_sitemap

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

# no layout
page "/404.html", :layout => false
page "/sitemap.xml", :layout => false

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
      "Southwest Recording provides the best audio products in the business, usually delivered the same business day. All for a refreshingly affordable price."
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

# Clean URLs
activate :directory_indexes
page "/404.html", :directory_index => false

# Build-specific configuration
configure :build do
  # Enable gzip
  activate :gzip

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

  activate :minify_html do |html|
    html.remove_multi_spaces        = true   # Remove multiple spaces
    html.remove_comments            = true   # Remove comments
    html.remove_intertag_spaces     = false  # Remove inter-tag spaces
    html.remove_quotes              = true   # Remove quotes
    html.simple_doctype             = false  # Use simple doctype
    html.remove_script_attributes   = true   # Remove script attributes
    html.remove_style_attributes    = true   # Remove style attributes
    html.remove_link_attributes     = true   # Remove link attributes
    html.remove_form_attributes     = false  # Remove form attributes
    html.remove_input_attributes    = true   # Remove input attributes
    html.remove_javascript_protocol = true   # Remove JS protocol
    html.remove_http_protocol       = false  # Remove HTTP protocol
    html.remove_https_protocol      = false  # Remove HTTPS protocol
    html.preserve_line_breaks       = false  # Preserve line breaks
    html.simple_boolean_attributes  = true   # Use simple boolean attributes
    # html.preserve_patterns          = nil    # Patterns to preserve
  end
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host   = '45.55.82.64'
  deploy.path   = '/var/www/southwestrecording.com/public'
  # Optional Settings
  deploy.user  = 'alpha' # no default
  deploy.port  = 1776 # ssh port, default: 22
  deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end
