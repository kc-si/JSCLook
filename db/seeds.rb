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
    isin: 'PLALIOR00045',
  },
  {
    name: 'KOGENERA',
    isin: 'PLKGNRC00015',
  },
  {
    name: 'LIVECHAT',
    isin: 'PLLVTSF00010',
  },
  {
    name: 'LUBAWA',
    isin: 'PLLUBAW00013',
  },
  {
    name: 'MERCATOR',
    isin: 'PLMRCTR00015',
  },
  {
    name: 'MOSTALPLC',
    isin: 'PLMSTPL00018',
  },
  {
    name: 'APATOR',
    isin: 'PLAPATR00018',
  },
  {
    name: 'BIOMASS',
    isin: 'PLBMSEP00011',
  },
  {
    name: 'EKOBOX',
    isin: 'PLEKOBX00018',
  },
]

companies_attrs.each { |company_attrs| Company.find_or_create_by!(company_attrs) }
