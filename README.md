# Dasher Ruby Client

This client allows you to easily update screen data for [Dasher](http://dasher.tv).
You can use this gem to easily push new data to any of your Dasher screens with
ease.

## Installation

Just install the gem into your `Gemfile` to get started.

```ruby
gem "dasher-ruby", "~> 1.0", :require => "dasher"
```

## Usage

```ruby
# Getting screen and square information
Dasher.client.screens       #=>   Returns an array of screens
Dasher.client.screen(1)     #=>   Return information about a given screen by ID

# You can update a specific property quickly by providing the path to the property
# you want to change. You should provide the ID (or path) to the square, the
# key of the property you want to change and the new value.
Dasher.client.update_property(2, "number", 4001)
Dasher.client.update_property("screen1.signups", "number", 4001)

# Updating lists is also easy. You provide the square ID (or path), an optional
# identifier allowing you to remove/edit this item again in the future and the
# properties for the list item.
Dasher.client.add_list_item(2, nil, {"text" => "Some properties", "color" => "red"})

# You can also provide a full new list of updates. Screens will automatically
# remove, add or edit items as appropriate. Any items without identifiers will
# be removed.
Dasher.client.replace_list(2, [
  {"identifier" => "A", "properties" => {"text" => "Some example text on row A"}},
  {"identifier" => "B", "properties" => {"text" => "Some example text on row B"}}
])
```

The `Dasher.client` instance is automatically configured to use the production
Dasher endpoints and the key in the `DASHER_TOKEN` environment variable.
You can create your own clients if you would like.

```ruby
client = Dasher::Client.new(host, token, :port => 443, :ssl => true)
client.screens
# etc...
```
