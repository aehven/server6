#!/bin/bash

function genreset {
  cd $SERVER_HOME
  rails db:drop db:create db:schema:load db:migrate
  rails db:seed
  mysqldump --login-path=local ${BASE_NAME}_develop > reset.sql
}

function dbreset {
  JUST_RESET=false

  if [[ ! -f $SERVER_HOME/reset.sql ]]
    then
    genreset
    JUST_RESET=true
  fi

  if [[ "$JUST_RESET" != "true" ]]; then
    mysql --login-path=local --database ${BASE_NAME}_develop < reset.sql
  fi

  echo "Database reset."
}

echo "SERVER_HOME = $SERVER_HOME"
