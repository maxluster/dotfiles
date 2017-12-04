echo "installing bugsnag"

cd "bugsnag"

brew bundle

brew services start homebrew/versions/mongodb26
brew services start rabbitmq
brew services start homebrew/versions/redis28
brew services start elasticsearch@1.7

cd ".."
