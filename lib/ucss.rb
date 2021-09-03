require_relative 'colors'
require_relative 'spacing'
require_relative 'hash'

class UCss
  REGEX = /[^<>"'`\s]*[^<>"'`\s:]/.freeze


  def self.spacing(properties)
    SPACING.transform_values do |v|
      properties.map do |p|
        "#{p}: #{v}"
      end.join('; ')
    end
  end

  def self.colors(property)
    COLORS.deep_transform_values do |v|
      "#{property}: #{v}"
    end
  end

  def self.align(property)
    %w[left right center justify].map do |v|
      [v, "#{property}: #{v}"]
    end.to_h
  end

  def self.flex_align(property)
    {
      'start' => 'flex-start',
      'center' => 'center',
      'between' => 'space-between',
      'around' => 'space-around',
      'evenly' => 'space-evenly',
      'stretch' => 'stretch',
      'auto' => 'auto',
      'baseline' => 'baseline'
    }.transform_values { |v| "#{property}: #{v}" }
  end

  CLASS_MAP = {
    'bg' => colors('background'),
    'p' => spacing(['padding']),
    'py' => spacing(%w[padding-top padding-bottom]),
    'px' => spacing(%w[padding-left padding-right]),
    'm' => spacing(['margin']),
    'my' => spacing(%w[margin-top margin-bottom]),
    'mx' => spacing(%w[margin-left margin-right]),
    'text' => colors('color').merge(align('text-align')),
    'justify' => flex_align('justify-content').merge(
      { 'items' => flex_align('justify-items') },
      { 'self' => flex_align('justify-self') }
    ),
    'self' => flex_align('align-self'),
    'items' => flex_align('align-items'),
    'content' => flex_align('align-content'),
    'place' => {
      'content' => flex_align('place-content'),
      'items' => flex_align('place-items'),
      'self' => flex_align('self')
    },
    'gap' => spacing(%w[gap]).merge(
      { 'x' => spacing(%w[column-gap]) },
      { 'y' => spacing(%w[row-gap]) }
    ),
    'flex' => {
      'DEFAULT' => 'display: flex',
      'col' => 'flex-direction: column',
      'row' => 'flex-direction: row',
      '1' => 'flex: 1 1 0%',
      'auto' => 'flex: 1 1 auto',
      'initial' => 'flex: 0 1 auto',
      'none' => 'flex: none'
    }
  }.merge(COLORS).freeze

  @@classes = []

  def self.css(str)
    @@classes << str.split(' ').compact
    @@classes.flatten!.uniq!
  end

  def initialize
    @output = './assets/css/utility.css'
    @input  = './views/**/*.*'
    @matches = @@classes || []
  end

  def body(name)
    parts = name.split('-')

    content = CLASS_MAP.dig(*parts)

    content = content['DEFAULT'] if content.is_a?(Hash)

    return unless content

    ".#{name} { #{content}; }"
  end

  def content(classes = @matches)
    classes.map { |name| body(name) }.compact.join("\n")
  end

  def read(from: @input)
    files = Dir[from]

    files.each do |f|
      s = File.read f
      @matches << s.scan(REGEX)
    end

    @matches = @matches.flatten.compact.uniq
  end

  def write(to: @output)
    File.write to, content(@matches)
  end
end
