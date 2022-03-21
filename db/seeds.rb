# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

companies_attrs = [
  {
    name: 'ALIOR',
    symbol: 'PLALIOR00045',
  },
  {
    name: 'KOGENERA',
    symbol: 'PLKGNRC00015',
  },
  {
    name: 'LIVECHAT',
    symbol: 'PLLVTSF00010',
  },
  {
    name: 'LUBAWA',
    symbol: 'PLLUBAW00013',
  },
  {
    name: 'MERCATOR',
    symbol: 'PLMRCTR00015',
  },
  {
    name: 'MOSTALPLC',
    symbol: 'PLMSTPL00018',
  },
  {
    name: 'APATOR',
    symbol: 'PLAPATR00018',
  },
  {
    name: 'BIOMASS',
    symbol: 'PLBMSEP00011',
  },
  {
    name: 'EKOBOX',
    symbol: 'PLEKOBX00018',
  },
]

companies_attrs.each { |company_attrs| Company.find_or_create_by!(company_attrs) }
