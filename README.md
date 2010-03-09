# Graphs on Rails

Graphs on Rails is a WebUI to display all your monitoring graphs. It can handle data from different sources (named Data Providers.

You can look at a demo here : http://graphs-on-rails.renchap.com/

The application is written in Ruby, using the Ruby on Rails 3 framework (currently in bêta). The graphs rendering is done using the Flot Javascript library and jQuery.

This is still a work in progress.

## Features

* Supports multiple data providers. These modules are easy to write, and allow you to graph what you want
* Does not hammers your server (graph rendering is done on client-side and on-demand)
* Refresh the graph every 10s

## Data Providers

These data providers are currently implemented :

* Collectd (from RRD files)

Planned :

* Munin (from RRD files)

## Requirements

* Ruby (tested with 1.8.7 and 1.9.1)
* Bundler (gem install bundler)

These dependancies are installed by bundler (see Installation section) :

* Rails 3
* HAML
* RRD-FFI if you use an RRD-Based data provider

## Installation

Graphs on Rails is a Rails application. It has been tested with Thin and Passenger.
Refer to their respective documentation on how to configure your webserver to serve Graphs on Rails.

Once the webserver is setup, folow these steps :

<pre>
export RAILS_ENV=production	# Work in production environment
bundle install		# Install all required gems
rake db:setup			# Create the database
rails console			# Enter the rails console
> r = Repository.new(:name => 'name', :type => 'collectd', :path => '/path/to/collectd/rrds').save # Create a collectd repository
> r.scan			# Scan the repository and import metrics
</pre>

Repositories, hosts and metrics should now show up in the WebUI.

## Contributing

Feel free to contribute to the project. Please fork it, create a ticket describing what you want to do on GitHub (http://github.com/renchap/graphs-on-rails/issues) and send a pull request when the job is done.

## Credits

* Renaud Chaput (renchap)
