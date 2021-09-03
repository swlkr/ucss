class UCss
  REGEX = /[^[%w\[]^<>"'`\s]*[^<>"'`\s:^[\[\]]]/

  CLASS_MAP = {
    'black' => '#000',
    'white' => '#fff',
    'rose' => {
      '50' => '#fff1f2',
      '100' => '#ffe4e6',
      '200' => '#fecdd3',
      '300' => '#fda4af',
      '400' => '#fb7185',
      '500' => '#f43f5e',
      '600' => '#e11d48',
      '700' => '#be123c',
      '800' => '#9f1239',
      '900' => '#881337'
    },
    'pink' => {
      '50' => '#fdf2f8',
      '100' => '#fce7f3',
      '200' => '#fbcfe8',
      '300' => '#f9a8d4',
      '400' => '#f472b6',
      '500' => '#ec4899',
      '600' => '#db2777',
      '700' => '#be185d',
      '800' => '#9d174d',
      '900' => '#831843'
    },
    'fuchsia' => {
      '50' => '#fdf4ff',
      '100' => '#fae8ff',
      '200' => '#f5d0fe',
      '300' => '#f0abfc',
      '400' => '#e879f9',
      '500' => '#d946ef',
      '600' => '#c026d3',
      '700' => '#a21caf',
      '800' => '#86198f',
      '900' => '#701a75'
    },
    'purple' => {
      '50' => '#faf5ff',
      '100' => '#f3e8ff',
      '200' => '#e9d5ff',
      '300' => '#d8b4fe',
      '400' => '#c084fc',
      '500' => '#a855f7',
      '600' => '#9333ea',
      '700' => '#7e22ce',
      '800' => '#6b21a8',
      '900' => '#581c87'
    },
    'violet' => {
      '50' => '#f5f3ff',
      '100' => '#ede9fe',
      '200' => '#ddd6fe',
      '300' => '#c4b5fd',
      '400' => '#a78bfa',
      '500' => '#8b5cf6',
      '600' => '#7c3aed',
      '700' => '#6d28d9',
      '800' => '#5b21b6',
      '900' => '#4c1d95'
    },
    'indigo' => {
      '50' => '#eef2ff',
      '100' => '#e0e7ff',
      '200' => '#c7d2fe',
      '300' => '#a5b4fc',
      '400' => '#818cf8',
      '500' => '#6366f1',
      '600' => '#4f46e5',
      '700' => '#4338ca',
      '800' => '#3730a3',
      '900' => '#312e81'
    },
    'blue' => {
      '50' => '#eff6ff',
      '100' => '#dbeafe',
      '200' => '#bfdbfe',
      '300' => '#93c5fd',
      '400' => '#60a5fa',
      '500' => '#3b82f6',
      '600' => '#2563eb',
      '700' => '#1d4ed8',
      '800' => '#1e40af',
      '900' => '#1e3a8a'
    },
    'sky' => {
      '50' => '#f0f9ff',
      '100' => '#e0f2fe',
      '200' => '#bae6fd',
      '300' => '#7dd3fc',
      '400' => '#38bdf8',
      '500' => '#0ea5e9',
      '600' => '#0284c7',
      '700' => '#0369a1',
      '800' => '#075985',
      '900' => '#0c4a6e'
    },
    'cyan' => {
      '50' => '#ecfeff',
      '100' => '#cffafe',
      '200' => '#a5f3fc',
      '300' => '#67e8f9',
      '400' => '#22d3ee',
      '500' => '#06b6d4',
      '600' => '#0891b2',
      '700' => '#0e7490',
      '800' => '#155e75',
      '900' => '#164e63'
    },
    'teal' => {
      '50' => '#f0fdfa',
      '100' => '#ccfbf1',
      '200' => '#99f6e4',
      '300' => '#5eead4',
      '400' => '#2dd4bf',
      '500' => '#14b8a6',
      '600' => '#0d9488',
      '700' => '#0f766e',
      '800' => '#115e59',
      '900' => '#134e4a'
    },
    'emerald' => {
      '50' => '#ecfdf5',
      '100' => '#d1fae5',
      '200' => '#a7f3d0',
      '300' => '#6ee7b7',
      '400' => '#34d399',
      '500' => '#10b981',
      '600' => '#059669',
      '700' => '#047857',
      '800' => '#065f46',
      '900' => '#064e3b'
    },
    'green'=>{
      '50' => '#f0fdf4',
      '100' => '#dcfce7',
      '200' => '#bbf7d0',
      '300' => '#86efac',
      '400' => '#4ade80',
      '500' => '#22c55e',
      '600' => '#16a34a',
      '700' => '#15803d',
      '800' => '#166534',
      '900' => '#14532d'
    },
    'lime'=>{
      '50' => '#f7fee7',
      '100' => '#ecfccb',
      '200' => '#d9f99d',
      '300' => '#bef264',
      '400' => '#a3e635',
      '500' => '#84cc16',
      '600' => '#65a30d',
      '700' => '#4d7c0f',
      '800' => '#3f6212',
      '900' => '#365314'
    },
    'yellow'=>{
      '50' => '#fefce8',
      '100' => '#fef9c3',
      '200' => '#fef08a',
      '300' => '#fde047',
      '400' => '#facc15',
      '500' => '#eab308',
      '600' => '#ca8a04',
      '700' => '#a16207',
      '800' => '#854d0e',
      '900' => '#713f12'
    },
    'amber'=>{
      '50' => '#fffbeb',
      '100' => '#fef3c7',
      '200' => '#fde68a',
      '300' => '#fcd34d',
      '400' => '#fbbf24',
      '500' => '#f59e0b',
      '600' => '#d97706',
      '700' => '#b45309',
      '800' => '#92400e',
      '900' => '#78350f'
    },
    'orange'=>{
      '50' => '#fff7ed',
      '100' => '#ffedd5',
      '200' => '#fed7aa',
      '300' => '#fdba74',
      '400' => '#fb923c',
      '500' => '#f97316',
      '600' => '#ea580c',
      '700' => '#c2410c',
      '800' => '#9a3412',
      '900' => '#7c2d12'
    },
    'red'=>{
      '50' => '#fef2f2',
      '100' => '#fee2e2',
      '200' => '#fecaca',
      '300' => '#fca5a5',
      '400' => '#f87171',
      '500' => '#ef4444',
      '600' => '#dc2626',
      '700' => '#b91c1c',
      '800' => '#991b1b',
      '900' => '#7f1d1d'
    },
    'warmGray'=>{
      '50' => '#fafaf9',
      '100' => '#f5f5f4',
      '200' => '#e7e5e4',
      '300' => '#d6d3d1',
      '400' => '#a8a29e',
      '500' => '#78716c',
      '600' => '#57534e',
      '700' => '#44403c',
      '800' => '#292524',
      '900' => '#1c1917'
    },
    'trueGray'=>{
      '50' => '#fafafa',
      '100' => '#f5f5f5',
      '200' => '#e5e5e5',
      '300' => '#d4d4d4',
      '400' => '#a3a3a3',
      '500' => '#737373',
      '600' => '#525252',
      '700' => '#404040',
      '800' => '#262626',
      '900' => '#171717'
    },
    'gray'=>{
      '50' => '#fafafa',
      '100' => '#f4f4f5',
      '200' => '#e4e4e7',
      '300' => '#d4d4d8',
      '400' => '#a1a1aa',
      '500' => '#71717a',
      '600' => '#52525b',
      '700' => '#3f3f46',
      '800' => '#27272a',
      '900' => '#18181b'
    },
    'coolGray'=>{
      '50' => '#f9fafb',
      '100' => '#f3f4f6',
      '200' => '#e5e7eb',
      '300' => '#d1d5db',
      '400' => '#9ca3af',
      '500' => '#6b7280',
      '600' => '#4b5563',
      '700' => '#374151',
      '800' => '#1f2937',
      '900' => '#111827'
    },
    'blueGray'=>{
      '50' => '#f8fafc',
      '100' => '#f1f5f9',
      '200' => '#e2e8f0',
      '300' => '#cbd5e1',
      '400' => '#94a3b8',
      '500' => '#64748b',
      '600' => '#475569',
      '700' => '#334155',
      '800' => '#1e293b',
      '900' => '#0f172a'
    },
    'px' => '1px',
    '0' => '0px',
    '0.5' => '0.125rem',
    '1' => '0.25rem',
    '1.5' => '0.375rem',
    '2' => '0.5rem',
    '2.5' => '0.625rem',
    '3' => '0.75rem',
    '3.5' => '0.875rem',
    '4' => '1rem',
    '5' => '1.25rem',
    '6' => '1.5rem',
    '7' => '1.75rem',
    '8' => '2rem',
    '9' => '2.25rem',
    '10' => '2.5rem',
    '11' => '2.75rem',
    '12' => '3rem',
    '14' => '3.5rem',
    '16' => '4rem',
    '20' => '5rem',
    '24' => '6rem',
    '28' => '7rem',
    '32' => '8rem',
    '36' => '9rem',
    '40' => '10rem',
    '44' => '11rem',
    '48' => '12rem',
    '52' => '13rem',
    '56' => '14rem',
    '60' => '15rem',
    '64' => '16rem',
    '72' => '18rem',
    '80' => '20rem',
    '96' => '24rem',
    'bg' => 'background',
    'p' => 'padding',
    'm' => 'margin',
    'my'=> [
      'margin-top',
      'margin-bottom'
    ],
    'mx'=> [
      'margin-left',
      'margin-right'
    ],
    'text' => 'color',
    'text-left' => 'text-align: left',
    'text-right' => 'text-align: right',
    'stretch' => 'stretch',
    'center' => 'center',
    'self' => 'align-self',
    'items' => 'align-items',
    'flex-start' => 'flex-start',
    'flex-end' => 'flex-end',
    'flex-row' => 'flex-direction: row',
    'flex-col' => 'flex-direction: column',
    'flex-auto' => 'flex: 1 1 auto',
    'gap' => 'gap',
    'auto' => 'auto',
    'flex' => {
      'DEFAULT' => 'display: flex',
      '1' => '1 1 0%',
      'auto' => '1 1 auto',
      'initial' => '0 1 auto',
      'none' => 'none'
    }
  }.freeze

  def initialize
    @output = './assets/css/utility.css'
    @input  = './views/**/*.*'
    @matches = []
  end

  def body(name)
    # check for a direct key value pair
    if content = CLASS_MAP[name]
      if content.is_a?(Hash)
        return ".#{name} { #{content.dig('DEFAULT')}; }"
      else
        return ".#{name} { #{content}; }"
      end
    end

    # otherwise split it up and get property/value pair from modifiers
    parts = name.split('-')

    property = CLASS_MAP[parts[0]]

    return if property.nil? || property&.empty?

    value = CLASS_MAP.dig(*parts.drop(1))

    content = "#{property}: #{value};"

    content = property.map { |p| "#{p}: #{value};" }.join(' ') if property.is_a?(Array)

    ".#{name} { #{content} }"
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
