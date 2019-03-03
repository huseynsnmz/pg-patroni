#!/usr/bin/bash

# The script should be:
# Executable by Patroni
# should exit with code 0, otherwise Patroni thinks that it failed

/usr/pgsql-11/bin/psql -q -At -c 'SELECT 1;'

if [ $? != 0 ]; then
  psql -c 'CREATE EXTENSION pg_stat_statements;'
  exit 0;
fi
