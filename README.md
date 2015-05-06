[![Code Climate](https://codeclimate.com/github/factor-io/connector-jira/badges/gpa.svg)](https://codeclimate.com/github/factor-io/connector-jira)
[![Test Coverage](https://codeclimate.com/github/factor-io/connector-jira/badges/coverage.svg)](https://codeclimate.com/github/factor-io/connector-jira)
[![Build Status](https://travis-ci.org/factor-io/connector-jira.svg?branch=master)](https://travis-ci.org/factor-io/connector-jira)
[![Dependency Status](https://gemnasium.com/factor-io/connector-jira.svg)](https://gemnasium.com/factor-io/connector-jira)
[![Gem Version](https://badge.fury.io/rb/factor-connector-jira.svg)](http://badge.fury.io/rb/factor-connector-jira)

Factor.io Jira Connector
======================

Factor.io Connector for integrating with JIRA.

## Installation
Add this to your `Gemfile` in your [Connector](https://github.com/factor-io/connector)
```ruby
gem 'factor-connector-jira', '~> 0.0.3'
```

Add this to your `init.rb`  in your [Connector](https://github.com/factor-io/connector)

```ruby
require 'factor/connector/jira'
```

The [Connectors README](https://github.com/factor-io/connector#running) shows you how to run the Connector Server with this new connector integrated.

## Running tests
These tests are functional, they will call out to your Jira account and take actions.

```shell
bundle exec rake
```
