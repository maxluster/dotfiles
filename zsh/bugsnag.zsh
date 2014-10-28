alias bug="cd $HOME/bugsnag/bugsnag-website"

bugs(){
  cd $HOME/bugsnag/bugsnag-website
  bundle exec rails s
}

bugc(){
  cd $HOME/bugsnag/bugsnag-website
  bundle exec rails c
}
