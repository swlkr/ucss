require_relative 'classes'

class UCss
  REGEX = /[^<>"'`\s]*[^<>"'`\s:]/.freeze

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

    content = Classes::MAP.dig(*parts)

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
      @matches += s.scan(REGEX)
    end

    @matches.uniq!
  end

  def write(to: @output)
    File.write to, content(@matches)
  end
end
