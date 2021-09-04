require_relative 'colors'
require_relative 'spacing'
require_relative 'hash'
require_relative 'sizes'

class Classes
  class << self
    def spacing(properties)
      SPACING.transform_values do |v|
        properties.map do |p|
          "#{p}: #{v}"
        end.join('; ')
      end
    end

    def colors(property)
      COLORS.deep_transform_values do |v|
        "#{property}: #{v}"
      end
    end

    def align(property)
      %w[left right center justify].map do |v|
        [v, "#{property}: #{v}"]
      end.to_h
    end

    def flex_align(property)
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

    def sizes(property)
      SIZES.transform_values { |v| "#{property}: #{v}" }
    end
  end

  MAP = {
    'h' => spacing(['height']).merge(sizes('height')),
    'w' => spacing(['width']).merge(sizes('width')),
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
end
