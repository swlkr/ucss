require 'minitest/autorun'
require 'ucss'
require 'fileutils'

class UCssTest < Minitest::Test
  def setup
    @ucss = UCss.new
    Dir.mkdir './views'
    File.write('./views/layout.mab', 'div class: "p-4 bg-green-500 mx-auto" { \'whatever\' }')
  end

  def teardown
    FileUtils.rm_rf('./views')
  end

  def test_classes
    actual = @ucss.content(%w[p-4 bg-green-500])
    expected = '.p-4 { padding: 1rem; }\n.bg-green-500 { background: #22c55e; }'

    assert_equal expected, actual
  end

  def test_read
    expected = '.p-4 { padding: 1rem; }\n.bg-green-500 { background: #22c55e; }\n.mx-auto { margin-left: auto; margin-right: auto; }'
    @ucss.read
    actual = @ucss.content

    assert_equal expected, actual
  end
end
