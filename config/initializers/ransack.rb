# config/initializers/ransack.rb
Ransack.configure do |config|
  %w[
    contained_within
    contained_within_or_equals
    contains
    contains_or_equals
    overlap
  ].each do |p|
    config.add_predicate p, arel_predicate: p, wants_array: true
  end

  config.add_predicate 'cont', # Name your predicate
    arel_predicate: 'matches',
    formatter: proc { |s| ActiveSupport::Inflector.transliterate("%#{s}%") }, # Note the %%
    validator: proc { |s| s.present? },
    compounds: true,
    type: :string

end
