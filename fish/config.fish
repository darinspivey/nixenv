set -gx PATH . ./node_modules/.bin $PATH
set -gx GITHUB_TOKEN <INSERT TOKEN HERE>

fish_vi_key_bindings

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dspivey/google-cloud-sdk/path.fish.inc' ]; . '/Users/dspivey/google-cloud-sdk/path.fish.inc'; end
