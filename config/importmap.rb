# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
