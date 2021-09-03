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

  def test_p_4
    actual = @ucss.content %w[p-4]
    expected = '.p-4 { padding: 1rem; }'

    assert_equal expected, actual
  end

  def test_classes
    actual = @ucss.content(%w[p-4 bg-green-500])
    expected = ".p-4 { padding: 1rem; }\n.bg-green-500 { background: #22c55e; }"

    assert_equal expected, actual
  end

  def test_read
    expected = ".p-4 { padding: 1rem; }\n.bg-green-500 { background: #22c55e; }\n.mx-auto { margin-left: auto; margin-right: auto; }"
    @ucss.read
    actual = @ucss.content

    assert_equal expected, actual
  end

  def test_flex
    expected = ".flex { display: flex; }\n.flex-auto { flex: 1 1 auto; }\n.flex-col { flex-direction: column; }"
    actual = @ucss.content(%w[flex flex-auto flex-col])

    assert_equal expected, actual
  end

  def test_no_modifier_for_rule_that_exists
    expected = ''
    actual = @ucss.content(%w[p])

    assert_equal expected, actual
  end

  def test_text
    expected = ".text-green-500 { color: #22c55e; }\n.text-left { text-align: left; }"
    actual = @ucss.content %w[text-green-500 text-left]

    assert_equal expected, actual
  end

  def test_flex_align
    expected = ".justify-evenly { justify-content: space-evenly; }\n.justify-items-center { justify-items: center; }\n.items-center { align-items: center; }"
    actual = @ucss.content %w[justify-evenly justify-items-center items-center]

    assert_equal expected, actual
  end

  def test_nested_gap
    expected = ".gap-y-px { row-gap: 1px; }\n.gap-x-px { column-gap: 1px; }"
    actual = @ucss.content %w[gap-y-px gap-x-px]

    assert_equal expected, actual
  end
end
