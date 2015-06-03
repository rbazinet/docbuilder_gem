# Customerify

A ruby wrapper for the [DocBuilder.io](http://docbuilder.io) [API](https://docbuilder.io/api/docs/index.html).

## Installation

Add this line to your application's Gemfile:

    gem 'docbuilder'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install docbuilder

## Usage

In your code, create an instance of the client using your Account identifier and your API key:

    client = DocBuilder::Client.new your_account_identifier, your_api_key
    
