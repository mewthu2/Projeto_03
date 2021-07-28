# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# /app/assets

# /lib/assets


# lib/assets/images/img
Rails.application.config.assets.precompile += %w( img.jpg undraw_profile.svg undraw_profile_1.svg 
    undraw_profile_2.svg undraw_profile_3.svg )
