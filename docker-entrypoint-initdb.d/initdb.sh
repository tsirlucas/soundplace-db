#!/bin/bash
set -e

psql --username $POSTGRES_USER --dbname "$POSTGRES_DB" -f ../setup.sql
