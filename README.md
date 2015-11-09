# Teledash Ruby Client

This client allows you to easily update screen data for [Teledash](http://teledash.io).
You can use this gem to easily push new data to any of your Teledash screens with
ease.

## Installation

Just install the gem into your `Gemfile` to get started.

```ruby
gem "teledash", "~> 1.0"
```

## Usage

```ruby
# Getting screen and square information
Teledash.client.screens       #=>   Returns an array of screens
Teledash.client.screen(1)     #=>   Return information about a given screen by ID

# You can update a specific property quickly by providing the path to the property
# you want to change. You should provide the ID (or path) to the square, the
# key of the property you want to change and the new value.
Teledash.client.update_property(2, "number", 4001)
Teledash.client.update_property("screen1.signups", "number", 4001)

# Updating lists is also easy. You provide the square ID (or path), an optional
# identifier allowing you to remove/edit this item again in the future and the
# properties for the list item.
Teledash.client.add_list_item(2, nil, {"text" => "Some properties", "color" => "red"})

# You can also provide a full new list of updates. Screens will automatically
# remove, add or edit items as appropriate. Any items without identifiers will
# be removed.
Teledash.client.replace_list(2, [
  {"identifier" => "A", {"text" => "Some example text on row A"}},
  {"identifier" => "B", {"text" => "Some example text on row B"}}
])
```

The `Teledash.client` instance is automatically configured to use the production
Teledash endpoints and the key in the `TELEDASH_TOKEN` environment variable.
You can create your own clients if you would like.

```ruby
client = Teledash::Client.new(host, token, :port => 443, :ssl => true)
client.screens
# etc...
```
