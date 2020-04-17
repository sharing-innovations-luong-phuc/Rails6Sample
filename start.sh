#!/bin/bash

## Create new APP
# rails new sample
# cd sample

## Build App
bundle install
rails webpacker:install
rake assets:precompile

## Run App
# rails server -b 0.0.0.0
