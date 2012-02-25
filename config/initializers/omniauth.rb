Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'qVFBCgfJYu1C2RZkB70lw', 'KuqWnDToyguG0E48O9jnGyV6VpdNwVe4A3kxxHNRJ4'
  provider :facebook, '258235560922348', '17f671ebc4f103c567d68bbeacd01418'
end