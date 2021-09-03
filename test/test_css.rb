require 'minitest/autorun'
require 'ucss'

class CssTest < Minitest::Test
  def test_class_css
    expected = ".p-4 { padding: 1rem; }\n.bg-green-500 { background: #22c55e; }\n.mx-auto { margin-left: auto; margin-right: auto; }\n.px-4 { padding-left: 1rem; padding-right: 1rem; }\n.justify-between { justify-content: space-between; }"

    UCss.css('p-4 bg-green-500 mx-auto')
    UCss.css('px-4 p-4 justify-between')

    actual = UCss.new.content

    assert_equal expected, actual
  end
end
