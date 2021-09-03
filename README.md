# ucss

_Tailwind jit inspired utility css generator_

# What

This gem reads files in your view folders for tailwind-like classes and writes the resulting utility css classes to a css file.

Kind of like tailwind-jit, almost.

# Install

```sh
gem install ucss
```

or in your gemfile

```ruby
gem 'ucss'
```

# Usage

```ruby
ucss = UCss.new
ucss.read(from: './views')
ucss.write(to: './assets/css/utility.css')
```

# Scan-ability

This won't pick up dynamic string stuff so let's say you're using [markaby](https://github.com/markaby/markaby) and you have something like this:

```ruby
gap = 1
div class: "flex gap-#{gap}" do
  "this is an element"
end
```

That won't work, here's one way to get it working:

```ruby
gap = 0
gaps = ['gap-1']

div class: "flex #{gaps[gap]}" do
  'this is an element'
end
```

or you could do one better:

```ruby
def vstack(options = {}, &block)
  div class: "flex flex-row flex-auto items-center #{options[:class]}" do
    yield block if block
  end
end

vstack(class: 'gap-1') do
  div '1'
  div '2'
  div '3'
end
```

This is assuming you use markaby of course and you're trying to come up with re-usable bits of html.
